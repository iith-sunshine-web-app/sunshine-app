import 'package:flutter/material.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

import '../../services/data_fetch.dart';

// ignore: must_be_immutable
class PgHeads extends StatefulWidget {
  List<DataModel> pgMgmtData =[];
  List<DataModel> pgMentorData =[];
  List<DataModel> pgBuddyData =[];

  PgHeads({super.key,required this.pgBuddyData,required this.pgMentorData,required this.pgMgmtData,});

  @override
  State<PgHeads> createState() => _PgHeadsState();
}

class _PgHeadsState extends State<PgHeads> {

    @override
  void initState() {
    if(widget.pgBuddyData.isEmpty){
      widget.pgBuddyData = DataFetch.fetchWholeData('pg-management-heads');
    }
    if(widget.pgMentorData.isEmpty){
      widget.pgMentorData = DataFetch.fetchWholeData('pg-mentor-heads');
    }
    if(widget.pgMgmtData.isEmpty){
      widget.pgMgmtData = DataFetch.fetchWholeData('pg-mentor-heads');
    }
    
    super.initState();
  }


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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.pgMgmtData.length,
            // query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: widget.pgMgmtData[index].name, 
                  email: widget.pgMgmtData[index].email, 
                  phone: widget.pgMgmtData[index].phone, 
                  position: widget.pgMgmtData[index].position, 
                  imageLink: widget.pgMgmtData[index].image
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.pgMentorData.length,
            // query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: widget.pgMentorData[index].name, 
                  email: widget.pgMentorData[index].email, 
                  phone: widget.pgMentorData[index].phone, 
                  position: widget.pgMentorData[index].position, 
                  imageLink: widget.pgMentorData[index].image
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.pgBuddyData.length,
            // query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: widget.pgBuddyData[index].name, 
                  email: widget.pgBuddyData[index].email, 
                  phone: widget.pgBuddyData[index].phone, 
                  position: widget.pgBuddyData[index].position, 
                  imageLink: widget.pgBuddyData[index].image
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