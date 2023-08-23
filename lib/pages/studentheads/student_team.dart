import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/studentheads/mgmt_team.dart';
import 'package:sunshine_iith/pages/studentheads/pg_heads.dart';
import 'package:sunshine_iith/pages/studentheads/ug_heads.dart';

class StudentTeam extends StatelessWidget {
  const StudentTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
            bottom: const TabBar(
              indicatorColor: Colors.purple,
              labelColor: Colors.purple,
              unselectedLabelColor:  Color.fromARGB(255, 44, 37, 10),
              tabs: [
                Tab(text: 'UG HEADS',),
                Tab(text: 'PG HEADS',),
                Tab(text: 'MGMT TEAM',),
              ],
            ),
            backgroundColor: const Color(0xfff2b545),
          ),
          body:const TabBarView(
            children: [
              UgHeads(),
              PgHeads(),
              MGMTTeam(),
            ],
          ),
        ),
      ),
      
    );
  }
}