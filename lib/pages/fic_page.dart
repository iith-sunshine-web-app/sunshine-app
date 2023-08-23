import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sunshine_iith/services/data_fetch.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

class FICDataShow extends StatelessWidget {
  const FICDataShow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
            padding:  EdgeInsets.fromLTRB(10, 25, 10, 25),
            child:  Text(
              "FACULTY IN-CHARGE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                wordSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

            const SizedBox(height: 100.0,),


            Expanded(
              child: Center(
                child: FirebaseAnimatedList(
                  query: DataFetch.dataFromRTDB('fic'), 
                  itemBuilder: (context , snapshot , animation , index){
                    return DataShowingWidget(
                      name: snapshot.child('name').value.toString(), 
                      email: snapshot.child('email').value.toString(), 
                      phone: snapshot.child('phone').value.toString(), 
                      position: snapshot.child('position').value.toString(), 
                      imageLink: snapshot.child('image').value.toString()
                    );
                  }
                  ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}