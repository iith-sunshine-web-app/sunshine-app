import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/buddies/buddies.dart';
import 'package:sunshine_iith/pages/counsellors_page.dart';
import 'package:sunshine_iith/pages/faculty_rep.dart';
import 'package:sunshine_iith/pages/fic_page.dart';
import 'package:sunshine_iith/pages/mentors/mentors.dart';
import 'package:sunshine_iith/pages/studentheads/student_team.dart';
import 'package:sunshine_iith/widgets/custom_route.dart';

// ignore: must_be_immutable
class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  void initState() {
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
                Navigator.push(
                    context, CustomPageRoute(child: const FICDataShow()));
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
                    height: 2.0,
                  ),
                ],
              ),
            ),

            //second item
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(child: const CounsellorsPage()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 2.0,
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
                    height: 2.0,
                  ),
                ],
              ),
            ),

            //third item
            InkWell(
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const FacultyRep()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 2.0,
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
                    height: 2.0,
                  ),
                ],
              ),
            ),

            //fourth item
            InkWell(
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const StudentTeam()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 2.0,
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
                    height: 2.0,
                  ),
                ],
              ),
            ),

            //FIFTH item
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CustomPageRoute(
                      child: const MentorsScreen(),
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 2.0,
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
                    height: 2.0,
                  ),
                ],
              ),
            ),

            //SIXTH item
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CustomPageRoute(
                      child: const BuddiesScreen(),
                    ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 2.0,
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
                    height: 2.0,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
