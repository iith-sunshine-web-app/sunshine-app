import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sunshine_iith/services/firestore_data.dart';
import 'package:sunshine_iith/widgets/shimmer/team_card_shimmer.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';


// ignore: must_be_immutable
class CounsellorsPage extends StatefulWidget {
  CounsellorsPage({super.key});

  @override
  State<CounsellorsPage> createState() => _CounsellorsPageState();
}

class _CounsellorsPageState extends State<CounsellorsPage> {

  List setData = [];
  bool isLoading = true;

  @override
  void initState() {
    // setData = widget.data;
    //  if(widget.data.isEmpty){
    //   FirestoreData.getData('counsellors').then((List list){
    //   setState(() {
    //     setData = list;
    //   });
    // });
    // }
    // print('hhh');<
    getCounsellorsData();
    super.initState();
  }
  getCounsellorsData() async{
    List data = await FirestoreData.getData('counsellors');
    setState(() {
      setData = data;
      isLoading = false;
    });
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
            isLoading?
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (ctx,index){
                return const Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: TeamCardShimmer()
                  );
              }),
            )
            :
            Expanded(
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