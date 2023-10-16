import 'package:flutter/material.dart';
import 'package:sunshine_iith/admin/bottomsheet_booked_sessions.dart';
import 'package:sunshine_iith/services/session_data.dart';

class AdminBookSessionCard extends StatelessWidget {
  final String time;
  final String mode;
  final SessionData sessionData;

  const AdminBookSessionCard({super.key,required this.time,required this.mode,required this.sessionData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(36.0),
            ),
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
          context: context, 
          builder: (ctx){
          return   BookedSessionBottomsheet(
            name: sessionData.name,
            email: sessionData.email,
            date: sessionData.date,
            time: sessionData.time,
            contact: sessionData.phone!.trim(),
          );
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.orange,width: 1.8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('Mode: $mode',style: TextStyle(
                color: Colors.orange.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w300
              ),),
          ),
          trailing: const Icon(Icons.chevron_right_rounded,size: 36, color: Colors.orange),
            ),
        ),
      ),
    );
  }
}