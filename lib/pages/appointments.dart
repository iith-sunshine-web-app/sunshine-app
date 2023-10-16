import 'package:flutter/material.dart';
import 'package:sunshine_iith/widgets/appointments_card.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (ctx,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  child: AppointmentCard(counsellorsName: 'Yukti Rastogi',time: '04:00 PM',date: '16/10/2023',mode: 'Offline',),
                );
              })
            )
          ],
        ),
      ),
    );
  }
}