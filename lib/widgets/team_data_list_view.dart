import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_share_plus/open.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

class DataShowingList extends StatelessWidget {
  DataShowingList({super.key});

  var arrName = ['Bhaskar Mandal', 'Test Person 1' , 'Test Person 2', 'Test Person 3'];
  var arrEmail = ['ms22btech11010@iith.ac.in','testemail1@iith.ac.in','testemail2@iith.ac.in','testemail3@iith.ac.in'];
  var arrPhone = ['9647598624','121','16212','45655'];
  var arrPosition = ['App-Web Dev Team', 'UG Management Head', 'UG Buddy Head','App-Web Dev Team'];
  var arrImage = ['https://media.licdn.com/dms/image/D4D03AQH5hluDGyJmRg/profile-displayphoto-shrink_800_800/0/1689757969646?e=2147483647&v=beta&t=fRwpAbHJ-7meh6Fmi1UzaT-sbnJMxyhOZxdnLV4LyzY' ,
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU',
                  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: DataShowingWidget(name: arrName[index], email:arrEmail[index], phone: arrPhone[index],position: arrPosition[index], imageLink: arrImage[index]),
          );
        },
        itemCount: arrName.length,
      )


      
    );
  }
}