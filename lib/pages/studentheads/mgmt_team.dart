import 'package:flutter/material.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

import '../../services/data_fetch.dart';

// ignore: must_be_immutable
class MGMTTeam extends StatefulWidget {
  Map<String,List<DataModel>> data;
   MGMTTeam({super.key,required this.data});

  @override
  State<MGMTTeam> createState() => _MGMTTeamState();
}

class _MGMTTeamState extends State<MGMTTeam> {
  List<String> posArr = ['web-app-team' , 'finance-team', 'publicity-team' , 'content-team', 'photo-team', 'des-team', 'newsletter-team', 'logistics-team', 'video-team'];
  List<String> typeArr = ['Web & App Dev Team' , 'Finance Managers' , 'Publicity Team', 'Content Team' , 'Photography Team',
   'Design Team' ,'Newsletter Team', 'Logistics Team','Video Editorial Team'];
Map<String,List<DataModel>> setData={};
  @override
  void initState() {
    setData = widget.data;

    if(setData[posArr[0]]!.isEmpty){
      setState(() {
        setData.update(posArr[0], (value) =>DataFetch.fetchWholeData(posArr[0]) );
      });
    }
    if(setData[posArr[1]]!.isEmpty){
      setState(() {
        setData[posArr[1]]=DataFetch.fetchWholeData('management-team${posArr[1]}');
      });
    }
    if(setData[posArr[0]]!.isEmpty){
      setState(() {
        setData[posArr[2]]=DataFetch.fetchWholeData('management-team${posArr[2]}');
      });
    }
    if(setData[posArr[3]]!.isEmpty){
      setState(() {
        setData[posArr[3]]=DataFetch.fetchWholeData('management-team${posArr[3]}');
      });
    }
    if(setData[posArr[4]]!.isEmpty){
      setState(() {
        setData[posArr[4]]=DataFetch.fetchWholeData('management-team${posArr[4]}');
      });
    }
    if(setData[posArr[5]]!.isEmpty){
      setState(() {
        setData[posArr[5]]=DataFetch.fetchWholeData('management-team${posArr[5]}');
      });
    }
    if(setData[posArr[6]]!.isEmpty){
      setState(() {
        setData[posArr[6]]=DataFetch.fetchWholeData('management-team${posArr[6]}');
      });
    }
    if(setData[posArr[7]]!.isEmpty){
      setState(() {
        setData[posArr[7]]=DataFetch.fetchWholeData('management-team${posArr[7]}');
      });
    }
    if(setData[posArr[8]]!.isEmpty){
      setState(() {
        setData[posArr[8]]=DataFetch.fetchWholeData('management-team${posArr[8]}');
      });
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            
            textWidget(typeArr.elementAt(0)),
            detailsWidget(setData[posArr[0]]),

            textWidget(typeArr.elementAt(1)),
            detailsWidget(setData[posArr[1]]),

            textWidget(typeArr.elementAt(2)),
            detailsWidget(setData[posArr[2]]),

            textWidget(typeArr.elementAt(3)),
            detailsWidget(setData[posArr[3]]),

            textWidget(typeArr.elementAt(4)),
            detailsWidget(setData[posArr[4]]),

            textWidget(typeArr.elementAt(5)),
            detailsWidget(setData[posArr[5]]),

            textWidget(typeArr.elementAt(6)),
            detailsWidget(setData[posArr[6]]),

            textWidget(typeArr.elementAt(7)),
            detailsWidget(setData[posArr[7]]),

            textWidget(typeArr.elementAt(8)),
            detailsWidget(setData[posArr[8]]),

          ] ,
            
          
        ),
      ),
    );
  }

  Widget textWidget(String text){
    return 
      Padding(
            padding: const EdgeInsets.fromLTRB(0, 20 , 0, 20),
            child: Text(
            text,
            textAlign: TextAlign.center,
            style:const TextStyle(
            fontSize: 28,
            wordSpacing: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
    );
  }

  Widget detailsWidget(List<DataModel>? list){
    return 
    ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list!.length,
            // query: DataFetch.dataFromRTDB('management-team').child(pos), 
            itemBuilder: (context  , index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: DataShowingWidget(
                  name: list[index].name, 
                  email: list[index].email, 
                  phone: list[index].phone, 
                  position: list[index].position, 
                  imageLink: list[index].image
                ),
              );
            }
      );
  }

}