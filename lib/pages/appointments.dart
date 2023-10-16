import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/services/session_data.dart';
import 'package:sunshine_iith/widgets/appointments_card.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {

  @override
  void initState() {
    super.initState();
    getAllAppointementData();
  }
  List<SessionData> currentData = [];
  List<SessionData> upcomingData = [];
  List<SessionData> olderData = [];
  List<SessionData> sessionData = [];
  bool isLoading = true;

DateTime convertToDateTime(String dateStr) {
  try {
    final date = DateFormat("dd/MM/yyyy").parse(dateStr);
    return date;
  } catch (e) {
    print("Error parsing date: $e");
    return DateTime(2000);
  }
}

  Future<void>  getAllAppointementData() async {
    DateTime today = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day,);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> result = await RealTimeDB()
        .getAppointmentList(uid);
    List<SessionData> data = [];
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
        if(convertToDateTime(sessionData.date).isBefore(today)){
          olderData.add(sessionData);
        }else if(convertToDateTime(sessionData.date).isAfter(today)){
          upcomingData.add(sessionData);
        }else{
          currentData.add(sessionData);
        }
        print('Current : $currentData\n');
        print('older : $olderData\n');
        print('upcoming : $upcomingData\n');
        setState(() {
          
        });
      });
    }
    setState(() {
      sessionData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff2b545),
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Your Appointments',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: SafeArea(
        child: 
        isLoading? const Center(child: CircularProgressIndicator(color: Colors.orange,)):
        sessionData.isEmpty? 
        const Center(
          child: Text(
            'You Don\'t have any appointments',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),
          ),
        ):
        SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              if(currentData.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 12,top: 12),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),

              if(currentData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentData.length,
                itemBuilder: (ctx,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: AppointmentCard(counsellorsName: currentData.elementAt(index).counsellorsName,time: currentData.elementAt(index).time,date: currentData.elementAt(index).date,mode: currentData.elementAt(index).mode,),
                );
              }),

              if(upcomingData.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 12,top: 12),
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              if(upcomingData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: upcomingData.length,
                itemBuilder: (ctx,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: AppointmentCard(counsellorsName: upcomingData.elementAt(index).counsellorsName,time: upcomingData.elementAt(index).time,date: upcomingData.elementAt(index).date,mode: upcomingData.elementAt(index).mode,),
                );
              }),
              if(olderData.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 12,top: 12),
                child: Text(
                  'Older',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
              if(olderData.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: olderData.length,
                itemBuilder: (ctx,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: AppointmentCard(counsellorsName: olderData.elementAt(index).counsellorsName,time: olderData.elementAt(index).time,date: olderData.elementAt(index).date,mode: olderData.elementAt(index).mode,),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}