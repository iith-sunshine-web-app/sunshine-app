import 'package:flutter/material.dart';
import 'package:sunshine_iith/admin/booked_sessions.dart';
import 'package:sunshine_iith/chatbot/chatbot_intro.dart';
import 'package:sunshine_iith/pages/sunshine_teams.dart';

import '../widgets/drawer_nav_bar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "Sunshine IITH",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 1.1,
            color: Colors.black87,
          ),
        ),
        backgroundColor: const Color(0xfff2b545),
      ),
      body: const Center(
        child: SingleChildScrollView(child: HomeScreen()),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 70.0),
          Image.asset(
            'assets/images/sunshine_7.jpg',
            height: 260.0,
          ),
          const SizedBox(height: 35.0),
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              'We at Sunshine believe in helping you to help yourself.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 80.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //first button , "Sunshine Team"
              SizedBox(
                width: 95,
                height: 159,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TeamPage()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TeamPage(),));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 217, 229, 250),
                      elevation: 10.0,
                      shadowColor: const Color.fromARGB(255, 92, 64, 251),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Icon(
                        Icons.people,
                        size: 35.0,
                        color: Colors.blue[700],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("Sunshine\nTeam",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),

              //second button , "Session Booking"
              SizedBox(
                width: 95,
                height: 159,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SessionBookIntro()));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BookedSessionsScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 229, 255, 228),
                      elevation: 10.0,
                      shadowColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Icon(
                        Icons.schedule,
                        size: 35.0,
                        color: Colors.green[700],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("Booked\nSessions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),

              //third button , "Chat bot"
              SizedBox(
                width: 95,
                height: 159,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatBot()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddData()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 246, 236),
                      elevation: 10.0,
                      shadowColor: Colors.orange[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Icon(
                        Icons.forum,
                        size: 35.0,
                        color: Colors.orange[700],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text("Chat\nBot",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
