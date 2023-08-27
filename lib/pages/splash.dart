import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/loading_splash.dart';
import 'package:sunshine_iith/services/data_fetch.dart';
import 'package:sunshine_iith/services/data_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool isLoggedIn=false;

  openLoadingPage(){
    dataStore.ugMgmtData = DataFetch.fetchWholeData('ug-management-heads');
    dataStore.ugMentorData = DataFetch.fetchWholeData('ug-mentor-heads');
    dataStore.ugBuddyData = DataFetch.fetchWholeData('ug-buddy-heads');
    dataStore.welfareSec = DataFetch.fetchWholeData('welfare-sec');
    
      Future.delayed(const Duration(milliseconds: 1500),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_)=>const LoadingSplash() ));
      });
    

    
  }

  final DataStore dataStore = DataStore();

  @override
  void initState() {
    
    super.initState();
    openLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/sunshine_logo.png',
              height: 220,),

              const SizedBox(height: 70.0,),

              // Text(
              //   'SUNSHINE'
              // )
            ],
          ),
        ),

      ),
    );
  }
}