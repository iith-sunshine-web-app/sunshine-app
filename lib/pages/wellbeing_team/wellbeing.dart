import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/wellbeing_team/phd_wellbeing.dart';

class WellBeingScreen extends StatelessWidget {
  const WellBeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 3,
        child: Scaffold(
          body:TabBarView(
            children: [
              PhDWellBeing()
            ],
          ),
          bottomNavigationBar:  TabBar(
              indicatorColor: Colors.purple,
              labelColor: Colors.purple,
              unselectedLabelColor:  Color.fromARGB(255, 44, 37, 10),
              tabs: [
                Tab(text: 'PhD WELL-BEING TEAM',),
              ],
            ),
            backgroundColor:  Color(0xfff2b545),
        ),
      );
  }
}