import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String counsellorsName;
  final String date;
  final String time;
  final String mode;
  const AppointmentCard({super.key,required this.counsellorsName,required this.date,required this.mode,required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange,width: 1.8),
      ),
      width: MediaQuery.of(context).size.width*0.8,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'You have an appointment with $counsellorsName',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.orange,
                fontSize: 19,
                letterSpacing: -0.2,
              ),
            ),
          ),
          const SizedBox(height: 12,),

          Text(
            'Date: $date',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.orange.withOpacity(0.9),
              fontSize: 18,
              letterSpacing: -0.2,
            ),
          ),
          Text(
            'Time: $time',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.orange.withOpacity(0.9),
              fontSize: 18,
              letterSpacing: -0.2,
            ),
          ),
          Text(
            'Mode: $mode',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.orange.withOpacity(0.8),
              fontSize: 18,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 5,),
        ]),
      ),
    );
  }
}