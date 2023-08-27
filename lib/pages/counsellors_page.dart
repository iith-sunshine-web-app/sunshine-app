import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunshine_iith/services/firestore_data.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

import '../services/data_fetch.dart';

class CounsellorsPage extends StatefulWidget {

  const CounsellorsPage({super.key});

  @override
  State<CounsellorsPage> createState() => _CounsellorsPageState();
}

class _CounsellorsPageState extends State<CounsellorsPage> {
  var data;

  @override
  void initState() {
    FirestoreData.getData('counsellors');
    super.initState();
  }

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
                'COUNSELLORS',
                textAlign: TextAlign.center,
                style:  GoogleFonts.openSans(
                  // fontStyle: ,
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // const SizedBox(height: 35.0,),

            Expanded(
              child: FirebaseAnimatedList(
                query: DataFetch.dataFromRTDB('counsellors'),
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