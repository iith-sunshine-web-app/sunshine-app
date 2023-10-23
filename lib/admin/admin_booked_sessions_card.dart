import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/services/session_data.dart';

class AdminBookSessionCard extends ConsumerWidget {
  final String time;
  final String mode;
  final SessionData sessionData;

  const AdminBookSessionCard(
      {super.key,
      required this.time,
      required this.mode,
      required this.sessionData});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.orange, width: 1.8)),
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
                  fontWeight: FontWeight.w400),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Message: $mode',
              style: TextStyle(
                  color: Colors.orange.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ),
          trailing: InkWell(
              onTap: () {
                //Show pop up and delete
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return showPopUp(context, sessionData,ref);
                    });
                print('Delete button clicked');
              },
              // splashColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.delete_rounded,
                    size: 24, color: Colors.orange),
              )),
        ),
      ),
    );
  }

  Widget showPopUp(BuildContext context, SessionData data,WidgetRef ref) {
    return AlertDialog(
      content: const Text('Are you sure you want to delete this session?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancle'),
          child: const Text('Cancle'),
        ),
        TextButton(
          onPressed: ()  {
            RealTimeDB().deleteSessionData(data);
            ref.read(bookedSessionProvider.notifier).deleteData(data.date, data);
            Navigator.pop(context,'Delete');
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
