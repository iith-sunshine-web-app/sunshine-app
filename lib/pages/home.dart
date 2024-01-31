import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:sunshine_iith/chatbot/chatbot_intro.dart';
import 'package:sunshine_iith/pages/session_book.dart/session_book_intro.dart';
import 'package:sunshine_iith/pages/sunshine_teams.dart';
import 'package:sunshine_iith/widgets/custom_route.dart';
import 'package:sunshine_iith/widgets/home_buttons.dart';

import '../widgets/drawer_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  checkNewUpdates() async {
    await Future.delayed(const Duration(seconds: 25));

    try {
      var updateInfo = await InAppUpdate.checkForUpdate();
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {}
          });
        } else if (updateInfo.flexibleUpdateAllowed) {
          InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              InAppUpdate.completeFlexibleUpdate();
            }
          });
        }
      }
    } catch (e) {
      debugPrint("Error in checking for update: $e");
    }
  }

  @override
  void initState() {
    checkNewUpdates();
    super.initState();
  }

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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 00.0),
          Image.asset(
            'assets/images/sunshine_7.jpg',
            height: 260.0,
          ),
          const SizedBox(height: 25.0),
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
              HomePageButton(
                  shadowColor: const Color.fromARGB(255, 92, 64, 251),
                  height: 159,
                  width: size.width * 0.25,
                  color: const Color.fromARGB(255, 217, 229, 250),
                  icon: Icon(
                    Icons.people,
                    size: 35.0,
                    color: Colors.blue[700],
                  ),
                  text: "Sunshine\nTeam",
                  onTap: () {
                    Navigator.of(context)
                        .push(CustomPageRoute(child: const TeamPage()));
                  }),
              HomePageButton(
                  width: size.width * 0.25,
                  height: 159,
                  color: const Color.fromARGB(255, 229, 255, 228),
                  icon: Icon(
                    Icons.schedule,
                    size: 35.0,
                    color: Colors.green[700],
                  ),
                  text: "Session\nBooking",
                  onTap: () {
                    Navigator.of(context)
                        .push(CustomPageRoute(child: const SessionBookIntro()));
                  },
                  shadowColor: Colors.green),
              HomePageButton(
                  height: 159,
                  width: size.width * 0.25,
                  color: const Color.fromARGB(255, 255, 246, 236),
                  icon: Icon(
                    Icons.forum,
                    size: 35.0,
                    color: Colors.orange[700],
                  ),
                  text: "Chat\nBot",
                  onTap: () {
                    Navigator.push(
                        context, CustomPageRoute(child: const ChatBot()));
                  },
                  shadowColor: Colors.orange[500] ?? Colors.orange)
            ],
          ),
        ],
      ),
    );
  }
}
