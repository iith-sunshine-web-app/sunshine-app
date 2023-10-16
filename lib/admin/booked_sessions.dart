import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunshine_iith/admin/admin_booked_sessions_card.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/services/session_data.dart';

class BookedSessionsScreen extends StatefulWidget {
  @override
  State<BookedSessionsScreen> createState() => _BookedSessionsScreenState();
}

class _BookedSessionsScreenState extends State<BookedSessionsScreen> {
  Map<String, String> counsellorsName = {
    'maria.morris@admin.iith.ac.in': 'Maria Morris',
    'ms22btech11010@iith.ac.in': 'Maria Morris', //TODO: Delete this
    'yukti.rastogi@admin.iith.ac.in': 'Yukti Rastogi',
    'phani.bhushan@admin.iith.ac.in': 'Phani Bhushan',
  };

  // final sessions = List.generate(15, (index) => '09:00 AM');
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
    getAllBookedSession();
    super.initState();
  }

  bool isLoading = true;
  Map<String, List<SessionData>> bookedSessionData = {};

  Future<void> getBookedSession(String date) async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    List<SessionData> data = [];
    if (email != null) {
      Map<String, dynamic> result = await RealTimeDB()
          .getCounsellorsSessionsData(counsellorsName[email]!, date);
      if (result.isNotEmpty) {
        result.forEach((key, value) {
          SessionData sessionData = SessionData(
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
    }
    setState(() {
      bookedSessionData[date] = data;
    });
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
      print('Error fetching booked sessions in parallel: $error');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(bookedSessionData);
    return Scaffold(
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
          isLoading? const Center(child: CircularProgressIndicator(color: Colors.orange,)):
          bookedSessionData[whichDate]!=null && bookedSessionData[whichDate]!.isEmpty ? 
            const Center(
          child: Text(
            'No sessions!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),
          ),
        ):
          Expanded(
            child: ListView.builder(
              itemCount:  bookedSessionData[whichDate]?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                  child: AdminBookSessionCard(
                      time: bookedSessionData[whichDate]![index].time, mode: bookedSessionData[whichDate]![index].mode ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
