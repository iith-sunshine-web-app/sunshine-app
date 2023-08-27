import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunshine_iith/services/firestore_data.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

// ignore: must_be_immutable
class FICDataShow extends StatefulWidget {
  List data;
  FICDataShow({super.key,required this.data});

  @override
  State<FICDataShow> createState() => _FICDataShowState();
}

class _FICDataShowState extends State<FICDataShow> {

  List setData = [];

    @override
  void initState() {
    setData = widget.data;
    if(widget.data.isEmpty){
      FirestoreData.getData('fic').then((List list){
      setState(() {
        setData = list;
      });
    });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
            child:  Text(
              "FACULTY IN-CHARGE",
              textAlign: TextAlign.center,
              style:  GoogleFonts.openSans(
                  // fontStyle: ,
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
            ),
          ),

            const SizedBox(height: 75.0,),


            Expanded(
              child: Center(
                // child: FirebaseAnimatedList(
                //   query: DataFetch.dataFromRTDB('fic'), 
                //   itemBuilder: (context , snapshot , animation , index){
                //     return DataShowingWidget(
                //       name: snapshot.child('name').value.toString(), 
                //       email: snapshot.child('email').value.toString(), 
                //       phone: snapshot.child('phone').value.toString(), 
                //       position: snapshot.child('position').value.toString(), 
                //       imageLink: snapshot.child('image').value.toString()
                //     );
                //   }
                //   ),
                child: ListView.builder(
              itemCount: setData.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: DataShowingWidget(
                    name:setData[index]['name'],
                    email:setData[index]['email'],
                    phone:setData[index]['phone'],
                    position:setData[index]['position'],
                    imageLink:setData[index]['image'],

                  ),
                );
              }
            )
              ),
            )
            
          ],
        ),
      ),
    );
  }
}