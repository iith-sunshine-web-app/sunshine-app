import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/fic_page.dart';
import 'package:sunshine_iith/pages/studentheads/student_team.dart';
import 'package:sunshine_iith/widgets/dataShowingPage.dart';

import '../widgets/expansion_panel_faculty_rep.dart';

// ignore: must_be_immutable
class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  var arrListItem = ['FACULTY IN-CHARGE' , 'COUNSELLORS' , 'FACULTY REPRESENTATIVES' , 'STUDENT HEADS'];

  // var arrName = ['Bhaskar Mandal', 'Test Person 1' , 'Test Person 2', 'Test Person 3'];
  // var arrEmail = ['ms22btech11010@iith.ac.in','testemail1@iith.ac.in','testemail2@iith.ac.in','testemail3@iith.ac.in'];
  // var arrPhone = ['9647598624','121','16212','45655'];
  // var arrPosition = ['App-Web Dev Team', 'UG Management Head', 'UG Buddy Head','App-Web Dev Team'];
  // var arrImage = ['https://media.licdn.com/dms/image/D4D03AQH5hluDGyJmRg/profile-displayphoto-shrink_800_800/0/1689757969646?e=2147483647&v=beta&t=fRwpAbHJ-7meh6Fmi1UzaT-sbnJMxyhOZxdnLV4LyzY' ,
  //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU',
  //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU',
  //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIwRBD9gNuA2GjcOf6mpL-WuBhJADTWC3QVQ&usqp=CAU',
  //                 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sunshine Team',
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
            ),
          ),
          backgroundColor: Colors.orange[300],
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/sunshine_3.jpg'),

          //first item
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const FICDataShow() ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255,255, 223, 119),
                  child: Center(
                    child: Text(
                      arrListItem[0],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),

          //second item
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const DataShowingPage(
                pos: 'counsellors', type: 'COUNSELLORS',
              ) ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255, 252, 207, 62),
                  child: Center(
                    child: Text(
                      arrListItem[1],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),

          //third item
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExpansionPanelFacultyRep() ));

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255,251, 177, 36),
                  child: Center(
                    child: Text(
                      arrListItem[2],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),

          //fourth item
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudentTeam() ));

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 5.0,),
                Container(
                  height: 150.0,
                  color: const Color.fromARGB(255,253, 154, 36),
                  child: Center(
                    child: Text(
                      arrListItem[3],
                      style: const TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0,),
              ],
            ),
          ),
        
        ],
      )
      
    );
  }
}