import 'package:flutter/material.dart';
import 'package:sunshine_iith/services/data_fetch.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';


// ignore: must_be_immutable
class UgHeads extends StatefulWidget {
  List<DataModel> ugMgmtData ;
  List<DataModel> ugMentorData ;
  List<DataModel> ugBuddyData;
  List<DataModel> welfareSec;
  UgHeads({super.key,required this.ugBuddyData,required this.ugMentorData,required this.ugMgmtData,required this.welfareSec,});

  @override
  State<UgHeads> createState() => _UgHeadsState();
}

class _UgHeadsState extends State<UgHeads> {

  List setDataMgmt=[];
  List setDataMntr=[];
  List setDataBudd=[];
  List setDataWelf=[];

  @override
  void initState() {

    setDataMgmt = widget.ugMgmtData;
    setDataBudd = widget.ugBuddyData;
    setDataMntr = widget.ugMentorData;
    setDataWelf = widget.welfareSec;


    if(widget.ugBuddyData.isEmpty){
      setState(() {
        setDataBudd = DataFetch.fetchWholeData('ug-management-heads'); 
      });
    }
    if(widget.ugMentorData.isEmpty){
      setState(() {
        setDataMntr = DataFetch.fetchWholeData('ug-management-heads'); 
      });
    }
    if(widget.ugMgmtData.isEmpty){
      setState(() {
        setDataMgmt = DataFetch.fetchWholeData('ug-management-heads'); 
      });
    }
    if(widget.welfareSec.isEmpty){
      setState(() {
        setDataWelf = DataFetch.fetchWholeData('ug-management-heads'); 
      });
    }
    super.initState();
  }

  var posArr = {'ug-management-heads' , 'ug-mentor-heads' , 'ug-buddy-heads','welfare-sec' };

  var typeArr = {'Management Heads' , 'Mentorship Heads' , 'Buddy Heads' , 'Welfare Secretary'};

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
              itemCount: setDataMgmt.length,
            // query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: setDataMgmt[index].name, 
                  email: setDataMgmt[index].email, 
                  phone: setDataMgmt[index].phone, 
                  position: setDataMgmt[index].position, 
                  imageLink: setDataMgmt[index].image
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
              itemCount: setDataMntr.length,
            // query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: setDataMntr[index].name, 
                  email: setDataMntr[index].email, 
                  phone: setDataMntr[index].phone, 
                  position: setDataMntr[index].position, 
                  imageLink: setDataMntr[index].image
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
              itemCount: setDataBudd.length,
            // query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: setDataBudd[index].name, 
                  email: setDataBudd[index].email, 
                  phone: setDataBudd[index].phone, 
                  position: setDataBudd[index].position, 
                  imageLink: setDataBudd[index].image
                          ),
              );
            }
            ),


             //welfare sec
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20 , 0, 20),
              child: Text(
                  typeArr.elementAt(3),
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
              itemCount: setDataWelf.length,
            // query: DataFetch.dataFromRTDB(posArr.elementAt(0)), 
            itemBuilder: (context , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: setDataWelf[index].name, 
                  email: setDataWelf[index].email, 
                  phone: setDataWelf[index].phone, 
                  position: setDataWelf[index].position, 
                  imageLink: setDataWelf[index].image
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