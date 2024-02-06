import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sunshine_iith/admin/add_booked_sessions_bottomsheet.dart';
import 'package:sunshine_iith/admin/admin_booked_sessions_card.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/services/session_data.dart';

class BookedSessionsScreen extends ConsumerStatefulWidget {
  const BookedSessionsScreen({super.key});

  @override
  ConsumerState<BookedSessionsScreen> createState() =>
      _BookedSessionsScreenState();
}

class _BookedSessionsScreenState extends ConsumerState<BookedSessionsScreen> {
  Map<String, String> counsellorsName = {
    'maria.morris@admin.iith.ac.in': 'Maria Morris',
    'yukti.rastogi@admin.iith.ac.in': 'Yukti Rastogi',
    'phani.bhushan@admin.iith.ac.in': 'Phani Bhushan',
    'ms22btech11010@iith.ac.in': 'Maria Morris',
    'ce20btech11016@iith.ac.in': 'Maria Morris',
  };

  Map<String, DataModel> counsellorsData = {
    'maria.morris@admin.iith.ac.in': DataModel(
        name: 'Maria Morris',
        email: 'maria.morris@admin.iith.ac.in',
        phone: '8331036081',
        position: 'no need',
        image: 'no need'),
    'yukti.rastogi@admin.iith.ac.in': DataModel(
        name: 'Yukti Rastogi',
        email: 'yukti.rastogi@admin.iith.ac.in',
        phone: '8331036080',
        position: 'no need',
        image: 'no need'),
    'phani.bhushan@admin.iith.ac.in': DataModel(
        name: 'D. Phani Bhushan',
        email: 'phani.bhushan@admin.iith.ac.in',
        phone: '8331036082',
        position: 'sir',
        image: 'no need'),
  };

  late DataModel currentCounsellorsData;
  String currentCounsellorName = ''; //for passing to bottom sheet

  updateCurrentCounsellorsData() {
    String? email = FirebaseAuth.instance.currentUser!.email;
    DataModel data = counsellorsData[email] ??
        DataModel(
            name: 'null',
            email: 'null',
            phone: 'null',
            position: 'no need',
            image: 'no need');
    setState(() {
      currentCounsellorsData = data;
    });
  }

  String whichDate = '';

  String formatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  List<String> dates() {
    List<String> list = [];
    DateTime now = DateTime.now();
    for (var i = 0; i < 8; i++) {
      list.add(formatDate(now.add(Duration(days: i))));
    }
    return list;
  }

  List<String> listOfDates = [];

  @override
  void initState() {
    setState(() {
      whichDate = formatDate(DateTime.now());
    });
    setState(() {
      listOfDates.addAll(dates());
    });
    updateCurrentCounsellorsData();
    getAllBookedSession();
    super.initState();
  }

  bool isLoading = true;

  Future<void> getBookedSession(String date) async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    List<SessionData> data = [];
    if (ref.read(bookedSessionProvider)[date] == null && email != null) {
      setState(() {
        currentCounsellorName = counsellorsName[email]!;
      });
      Map<String, dynamic> result = await RealTimeDB()
          .getCounsellorsSessionsData(currentCounsellorName, date);
      if (result.isNotEmpty) {
        result.forEach((key, value) {
          SessionData sessionData = SessionData(
              counsellorsEmail: '',
              counsellorsPhone: '',
              date: value['date'],
              email: value['email'],
              name: value['name'],
              time: value['time'],
              counsellorsName: value['counsellor'],
              mode: value['mode'],
              phone: value['phone']);
          data.add(sessionData);
        });
      }
      ref.read(bookedSessionProvider.notifier).addAllData(date, data);
    }
  }

  Future<void> getAllBookedSession() async {
    final List<String> datesToFetch = [];

    for (var i = 0; i < 8; i++) {
      String date = formatDate(DateTime.now().add(Duration(days: i)));
      datesToFetch.add(date);
    }

    try {
      await Future.wait(datesToFetch.map((date) => getBookedSession(date)));
    } catch (error) {
      debugPrint('Error fetching booked sessions in parallel: $error');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List> bookedSessionData = ref.watch(bookedSessionProvider);

    return Scaffold(
      floatingActionButton:
          isLoading ? const SizedBox.shrink() : floatingActionButton(),
      appBar: AppBar(
        backgroundColor: const Color(0xfff2b545),
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Booked Sessions',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(36, 3, 0, 4),
            child: DropdownButton<String>(
              elevation: 0,
              underline: Container(),
              value: whichDate,
              items: listOfDates.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                        color: Color(0xfff2b545)),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  whichDate = value!;
                });
              },
              focusColor: Colors.white,
            ),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.orange,
                ))
              : bookedSessionData[whichDate] != null &&
                      bookedSessionData[whichDate]!.isEmpty
                  ? const Center(
                      child: Text(
                        'No sessions Today!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: bookedSessionData[whichDate]?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                            child: AdminBookSessionCard(
                                sessionData:
                                    bookedSessionData[whichDate]![index],
                                time: bookedSessionData[whichDate]![index].time,
                                mode:
                                    bookedSessionData[whichDate]![index].phone),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }

  Widget floatingActionButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 12, 20),
      child: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36.0),
                  ),
                ),
                backgroundColor: Colors.white,
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return AddBookedSession(
                    counsellorsName: currentCounsellorName,
                  );
                });
          }),
    );
  }
}
