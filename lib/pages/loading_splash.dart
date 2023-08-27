import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sunshine_iith/pages/home.dart';
import 'package:sunshine_iith/pages/login.dart';

class LoadingSplash extends StatefulWidget {
  const LoadingSplash({super.key});

  @override
  State<LoadingSplash> createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
Widget showWidget = SpinKitWave(
      size: 40,
      itemBuilder: (BuildContext context, int index) {
      return const DecoratedBox(
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 244, 197, 54),
      ),
    );
  },
);



  @override
  void initState() {

    super.initState();
    loggedIn();
  }

    Future<bool> checkLoggedIn() async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    return await googleSignIn.isSignedIn();
  }

  void loggedIn() async{
     bool login = await checkLoggedIn();
     if(login){
      Future.delayed(const Duration(milliseconds: 800),(){
        setState(() {
          showWidget = helloText();
        });
        openHomePage();
    });
      
     }else{
      openLoginPage();
     }
  }

openHomePage(){
    Future.delayed(const Duration(milliseconds: 800),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_)=>const HomePage() ));
    });
  }  
openLoginPage(){
    Future.delayed(const Duration(milliseconds: 500),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_)=>const LoginPage() ));
    });
  }  

  String usersDisplayName(){
    return FirebaseAuth.instance.currentUser!.displayName!.toString();
  }


  Widget helloText(){
    return Text(
      'Hello! ${usersDisplayName()}',
      style: GoogleFonts.openSans(
        fontSize: 17,
      ),
    );
  }

  Widget loading(){
    return SpinKitWave(
      size: 40,
      itemBuilder: (BuildContext context, int index) {
      return const DecoratedBox(
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 244, 197, 54),
      
      ),
    );
  },
);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sunshine_9.jpg',
                height: 250.0,
              ),
              const SizedBox(height: 30.0),
              Text(
                'Welcome!',
                style: GoogleFonts.openSans(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'We are Sunshine, your buddies to talk with',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 100.0),
    
              showWidget,
    
              
            ],
          ),
        ),
      ),
    );
  }
}