import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunshine_iith/admin/admin_booked_sessions_card.dart';

class BookedSessionsScreen extends StatefulWidget {
  @override
  State<BookedSessionsScreen> createState() => _BookedSessionsScreenState();
}

class _BookedSessionsScreenState extends State<BookedSessionsScreen> {
  final sessions = List.generate(15, (index) => '09:00 AM');
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                  child: AdminBookSessionCard(
                      time: sessions[index], mode: 'Offline'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
