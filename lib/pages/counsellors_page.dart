import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunshine_iith/services/firestore_data.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';


// ignore: must_be_immutable
class CounsellorsPage extends StatefulWidget {
  List data = [];
  CounsellorsPage({super.key,required this.data});

  @override
  State<CounsellorsPage> createState() => _CounsellorsPageState();
}

class _CounsellorsPageState extends State<CounsellorsPage> {

  List setData = [];

  @override
  void initState() {
    setData = widget.data;
     if(widget.data.isEmpty){
      FirestoreData.getData('counsellors').then((List list){
      setState(() {
        setData = list;
      });
    });
    }
    // print('hhh');<
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
            //   child: FirebaseAnimatedList(
            //     query: DataFetch.dataFromRTDB('counsellors'),
            //     itemBuilder: (context , snapshot , animation , index){
            //         return Padding(
            //           padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            //           child: DataShowingWidget(
            //             name: snapshot.child('name').value.toString(), 
            //             email: snapshot.child('email').value.toString(), 
            //             phone: snapshot.child('phone').value.toString(), 
            //             position: snapshot.child('position').value.toString(), 
            //             imageLink: snapshot.child('image').value.toString()),
            //         );
            //       }
            // ),
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
          ],
        ),
      ),
    );
  }
}