import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/mentors/pg_mentors.dart';
import 'package:sunshine_iith/pages/mentors/phd_mentors.dart';
import 'package:sunshine_iith/pages/mentors/ug_mentors.dart';

class MentorsScreen extends StatelessWidget {
  const MentorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body:TabBarView(
              children: [
                UgMentors(),
                PgMentors(),
                PhDMentors()
              ],
            ),
            bottomNavigationBar: TabBar(
                indicatorColor: Colors.purple,
                labelColor: Colors.purple,
                unselectedLabelColor:  Color.fromARGB(255, 44, 37, 10),
                tabs: [
                  Tab(text: 'UG MENTORS',),
                  Tab(text: 'PG MENTORS',),
                  Tab(text: 'PhD MENTORS',),
                ],
              ),
              backgroundColor: Color(0xfff2b545),
          ),
        ),
      );
  }
}