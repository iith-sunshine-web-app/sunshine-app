import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

import '../services/data_fetch.dart';

class DataShowingPage extends StatelessWidget {

  final String type,pos;

  const DataShowingPage({super.key,required this.pos, required this.type,});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
              child:  Text(
                type,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  wordSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // const SizedBox(height: 35.0,),

            Expanded(
              child: FirebaseAnimatedList(
                query: DataFetch.dataFromRTDB(pos),
                itemBuilder: (context , snapshot , animation , index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: DataShowingWidget(
                        name: snapshot.child('name').value.toString(), 
                        email: snapshot.child('email').value.toString(), 
                        phone: snapshot.child('phone').value.toString(), 
                        position: snapshot.child('position').value.toString(), 
                        imageLink: snapshot.child('image').value.toString()),
                    );
                  }
            ),
            ),
          ],
        ),
      ),
    );
  }
}