import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  List<SessionData> sessionData = [];
  bool isLoading = true;

  Future<void>  getAllAppointementData() async {
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
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: sessionData.length,
                itemBuilder: (ctx,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: AppointmentCard(counsellorsName: sessionData.elementAt(index).counsellorsName,time: sessionData.elementAt(index).time,date: sessionData.elementAt(index).date,mode: sessionData.elementAt(index).mode,),
                );
              })
            )
          ],
        ),
      ),
    );
  }
}