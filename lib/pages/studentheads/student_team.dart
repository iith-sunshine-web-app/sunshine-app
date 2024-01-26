import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunshine_iith/pages/studentheads/mgmt_team.dart';
import 'package:sunshine_iith/pages/studentheads/pg_heads.dart';
import 'package:sunshine_iith/pages/studentheads/ug_heads.dart';

// ignore: must_be_immutable
class StudentTeam extends StatelessWidget {
  

  const StudentTeam({super.key
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xfff2b545),
      statusBarBrightness: Brightness.dark,
    ));
    return const DefaultTabController(
        length: 3,
        child: Scaffold(
          body:TabBarView(
            children: [
              // UgHeads(),
              UgHeads(),
              PgHeads(),
              MGMTTeam(),
            ],
          ),
          bottomNavigationBar:  TabBar(
              indicatorColor: Colors.purple,
              labelColor: Colors.purple,
              unselectedLabelColor:  Color.fromARGB(255, 44, 37, 10),
              tabs: [
                Tab(text: 'UG HEADS',),
                Tab(text: 'PG HEADS',),
                Tab(text: 'MGMT TEAM',),
              ],
            ),
            backgroundColor:  Color(0xfff2b545),
        ),
    );
  }
}