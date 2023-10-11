import 'package:flutter/material.dart';
import 'package:sunshine_iith/services/data_model.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';


// ignore: must_be_immutable
class MGMTTeam extends StatelessWidget {
   MGMTTeam({super.key});

  List<String> posArr = ['web-app-team' , 'finance-team', 'publicity-team' , 'content-team', 'photo-team', 'des-team', 'newsletter-team', 'logistics-team', 'video-team'];

  List<String> typeArr = ['Web & App Dev Team' , 'Finance Managers' , 'Publicity Team', 'Content Team' , 'Photography Team',
   'Design Team' ,'Newsletter Team', 'Logistics Team','Video Editorial Team'];

Map<String,List<DataModel>> setData={};

  @override


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