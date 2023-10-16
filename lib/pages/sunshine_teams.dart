import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/buddies/buddies.dart';
import 'package:sunshine_iith/pages/counsellors_page.dart';
import 'package:sunshine_iith/pages/faculty_rep.dart';
import 'package:sunshine_iith/pages/fic_page.dart';
import 'package:sunshine_iith/pages/mentors/mentors.dart';
import 'package:sunshine_iith/pages/studentheads/student_team.dart';


// ignore: must_be_immutable
class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  // List counsellorsData=[];
  // List ficData=[];

  // //UG heads data
  // List<DataModel> ugMgmtData =[];
  // List<DataModel> ugMentorData =[];
  // List<DataModel> ugBuddyData =[];
  // List<DataModel> welfareSec =[];

  // //PG heads data
  // List<DataModel> pgMgmtData =[];
  // List<DataModel> pgMentorData =[];
  // List<DataModel> pgBuddyData =[];

  // Map<String, List<DataModel>> managementTeamData = {};
  // List<String> posArr = ['web-app-team' , 'finance-team', 'publicity-team' , 'content-team', 'photo-team', 'des-team', 'newsletter-team', 'logistics-team', 'video-team'];

  @override
  void initState() {
    // FirestoreData.getData('counsellors').then((List list){
    //   setState(() {
    //     counsellorsData = list;
    //   });
    // });
    // FirestoreData.getData('fic').then((List list){
    //   setState(() {
    //     ficData = list;
    //   });
    // });

    // ugMgmtData = DataFetch.fetchWholeData('ug-management-heads');
    // ugMentorData = DataFetch.fetchWholeData('ug-mentor-heads');
    // ugBuddyData = DataFetch.fetchWholeData('ug-buddy-heads');
    // welfareSec = DataFetch.fetchWholeData('welfare-sec');

    // pgMgmtData = DataFetch.fetchWholeData('pg-management-heads');
    // pgMentorData = DataFetch.fetchWholeData('pg-mentor-heads');
    // pgBuddyData = DataFetch.fetchWholeData('pg-buddy-heads');

    // managementTeamData[posArr[0]] = DataFetch.fetchWholeData('management-team/${posArr[0]}');
    // managementTeamData[posArr[1]] = DataFetch.fetchWholeData('management-team/${posArr[1]}');
    // managementTeamData[posArr[2]] = DataFetch.fetchWholeData('management-team/${posArr[2]}');
    // managementTeamData[posArr[3]] = DataFetch.fetchWholeData('management-team/${posArr[3]}');
    // managementTeamData[posArr[4]] = DataFetch.fetchWholeData('management-team/${posArr[4]}');
    // managementTeamData[posArr[5]] = DataFetch.fetchWholeData('management-team/${posArr[5]}');
    // managementTeamData[posArr[6]] = DataFetch.fetchWholeData('management-team/${posArr[6]}');
    // managementTeamData[posArr[7]] = DataFetch.fetchWholeData('management-team/${posArr[7]}');
    // managementTeamData[posArr[8]] = DataFetch.fetchWholeData('management-team/${posArr[8]}');

    super.initState();
  }

  var arrListItem = [
    'FACULTY IN-CHARGE',
    'COUNSELLORS',
    'FACULTY REPRESENTATIVES',
    'STUDENT HEADS',
    'MENTORS',
    'BUDDIES'
  ];

  // var arrName = ['Bhaskar Mandal', 'Test Person 1' , 'Test Person 2', 'Test Person 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          centerTitle: true,
          title: const Text(
            'Sunshine Team',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
            ),
          ),
          backgroundColor: const Color(0xfff2b545),
        ),
        body: ListView(
          children: [
            Image.asset('assets/images/sunshine_3.jpg'),

            //first item
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FICDataShow()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 150.0,
                    color: const Color.fromARGB(255, 255, 223, 119),
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
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),

            //second item
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounsellorsPage()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
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
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),

            //third item
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const FacultyRep()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 150.0,
                    color: const Color.fromARGB(234, 251, 176, 36),
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
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),

            //fourth item
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentTeam()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 150.0,
                    color: const Color.fromARGB(218, 253, 155, 36),
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
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),

            //FIFTH item
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const MentorsScreen(),
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 150.0,
                    color: const Color.fromARGB(242, 253, 155, 36),
                    child: Center(
                      child: Text(
                        arrListItem[4],
                        style: const TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),

            //SIXTH item
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => const BuddiesScreen(),
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 150.0,
                    color: const Color.fromARGB(255, 253, 154, 36),
                    child: Center(
                      child: Text(
                        arrListItem[5],
                        style: const TextStyle(
                          fontSize: 16.0,
                          letterSpacing: 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
