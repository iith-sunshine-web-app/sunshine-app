import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunshine_iith/pages/studentheads/mgmt_team.dart';
import 'package:sunshine_iith/pages/studentheads/pg_heads.dart';
import 'package:sunshine_iith/pages/studentheads/ug_heads.dart';

class StudentTeam extends StatelessWidget {
  const StudentTeam({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xfff2b545),
      statusBarBrightness: Brightness.dark,
    ));
    return const MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   toolbarHeight: 0.0,
            //   bottom: const TabBar(
            //     indicatorColor: Colors.purple,
            //     labelColor: Colors.purple,
            //     unselectedLabelColor:  Color.fromARGB(255, 44, 37, 10),
            //     tabs: [
            //       Tab(text: 'UG HEADS',),
            //       Tab(text: 'PG HEADS',),
            //       Tab(text: 'MGMT TEAM',),
            //     ],
            //   ),
            //   backgroundColor: const Color(0xfff2b545),
            // ),
            body:const TabBarView(
              children: [
                UgHeads(),
                PgHeads(),
                MGMTTeam(),
              ],
            ),
            // bottomNavigationBar: Container(
            //   height: 50.0,
            //   decoration: BoxDecoration(
            //     color:  Color(0xfff2b545),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
        
            //     ],
            //   ),
            // ),
            bottomNavigationBar: TabBar(
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
        ),
      ),
      
    );
  }
}