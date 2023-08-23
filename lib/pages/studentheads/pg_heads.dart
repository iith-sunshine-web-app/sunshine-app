import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

import '../../services/data_fetch.dart';

class PgHeads extends StatefulWidget {
  const PgHeads({super.key});

  @override
  State<PgHeads> createState() => _PgHeadsState();
}

class _PgHeadsState extends State<PgHeads> {
  var posArr = {'pg-management-heads' , 'pg-mentor-heads' , 'pg-buddy-heads' };
  var typeArr = {'Management Heads' , 'Mentorship Heads' , 'Buddy Heads' };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            //management haeds
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20 , 0, 20),
              child: Text(
                  typeArr.elementAt(0),
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontSize: 28,
                    wordSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
            FirebaseAnimatedList(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , snapshot , animation , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: snapshot.child('name').value.toString(), 
                  email: snapshot.child('email').value.toString(), 
                  phone: snapshot.child('phone').value.toString(), 
                  position: snapshot.child('position').value.toString(), 
                  imageLink: snapshot.child('image').value.toString()
                          ),
              );
            }
            ),
      
      
            //mentor heads
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20 , 0, 20),
              child: Text(
                  typeArr.elementAt(1),
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontSize: 28,
                    wordSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
            FirebaseAnimatedList(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            query: DataFetch.dataFromRTDB(posArr.elementAt(1)), 
            itemBuilder: (context , snapshot , animation , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: snapshot.child('name').value.toString(), 
                  email: snapshot.child('email').value.toString(), 
                  phone: snapshot.child('phone').value.toString(), 
                  position: snapshot.child('position').value.toString(), 
                  imageLink: snapshot.child('image').value.toString()
                          ),
              );
            }
            ),



             //Buddy heads
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20 , 0, 20),
              child: Text(
                  typeArr.elementAt(2),
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                    fontSize: 28,
                    wordSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
            FirebaseAnimatedList(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            query: DataFetch.dataFromRTDB(posArr.elementAt(2)), 
            itemBuilder: (context , snapshot , animation , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: snapshot.child('name').value.toString(), 
                  email: snapshot.child('email').value.toString(), 
                  phone: snapshot.child('phone').value.toString(), 
                  position: snapshot.child('position').value.toString(), 
                  imageLink: snapshot.child('image').value.toString()
                          ),
              );
            }
            ),
      
          ],
        ),
      ),
    );
  }
}