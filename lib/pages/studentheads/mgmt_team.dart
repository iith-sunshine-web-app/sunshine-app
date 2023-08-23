import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

import '../../services/data_fetch.dart';

class MGMTTeam extends StatefulWidget {
  const MGMTTeam({super.key});

  @override
  State<MGMTTeam> createState() => _MGMTTeamState();
}

class _MGMTTeamState extends State<MGMTTeam> {
  var posArr = {'web-app-team' , 'finance-team', 'publicity-team' , 'content-team', 'photo-team', 'des-team', 'newsletter-team', 'logistics-team', 'video-team'};
  var typeArr = {'Web & App Dev Team' , 'Finance Managers' , 'Publicity Team', 'Content Team' , 'Photography Team',
   'Design Team' ,'Newsletter Team', 'Logistics Team','Video Editorial Team'};


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            
            textWidget(typeArr.elementAt(0)),
            detailsWidget(posArr.elementAt(0)),

            textWidget(typeArr.elementAt(1)),
            detailsWidget(posArr.elementAt(1)),

            textWidget(typeArr.elementAt(2)),
            detailsWidget(posArr.elementAt(2)),

            textWidget(typeArr.elementAt(3)),
            detailsWidget(posArr.elementAt(3)),

            textWidget(typeArr.elementAt(4)),
            detailsWidget(posArr.elementAt(4)),

            textWidget(typeArr.elementAt(5)),
            detailsWidget(posArr.elementAt(5)),

            textWidget(typeArr.elementAt(6)),
            detailsWidget(posArr.elementAt(6)),

            textWidget(typeArr.elementAt(7)),
            detailsWidget(posArr.elementAt(7)),

            textWidget(typeArr.elementAt(8)),
            detailsWidget(posArr.elementAt(8)),

            // textWidget(typeArr.elementAt(9)),
            // detailsWidget(posArr.elementAt(9)),
    
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

  Widget detailsWidget(String pos){
    return 
    FirebaseAnimatedList(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            query: DataFetch.dataFromRTDB('management-team').child(pos), 
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
      );
  }

}