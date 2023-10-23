import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sunshine_iith/admin/home_page_admin.dart';
import 'package:sunshine_iith/pages/home.dart';
import 'package:sunshine_iith/pages/login.dart';
import 'package:sunshine_iith/providers/data_provider.dart';

class LoadingSplash extends ConsumerStatefulWidget {
  const LoadingSplash({super.key});

  @override
  ConsumerState<LoadingSplash> createState() => _LoadingSplashState();
}

class _LoadingSplashState extends ConsumerState<LoadingSplash> {
  Widget showWidget = SpinKitWave(
    size: 40,
    itemBuilder: (BuildContext context, int index) {
      return const DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 197, 54),
        ),
      );
    },
  );

  @override
  void initState() {
    super.initState();
    loggedIn();
  }

  List<String> adminEmails = [
    'maria.morris@admin.iith.ac.in',
    'yukti.rastogi@admin.iith.ac.in',
    'phani.bhushan@admin.iith.ac.in',
    // 'ms22btech11010@iith.ac.in',
  ];

  

  void redirectUser() {
    if (FirebaseAuth.instance.currentUser != null) {
      String email = FirebaseAuth.instance.currentUser!.email!;
      if(adminEmails.contains(email)){
        //redirtect to admin page
        ref.read(isAdminProvider.notifier).state = true;
        openAdminPage();
      }else{
        //redirect to user page
        openHomePage();
      }
    }
  }

  Future<bool> checkLoggedIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    return await googleSignIn.isSignedIn();
  }

  void loggedIn() async {
    bool login = await checkLoggedIn();
    if (login) {
      Future.delayed(const Duration(milliseconds: 900), () {
        setState(() {
          showWidget = helloText();
        });
        // openHomePage();
        redirectUser();
      });
    } else {
      openLoginPage();
    }
  }

  openHomePage() {
    Future.delayed(const Duration(milliseconds: 900), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
    });
  }
  openAdminPage() {
    Future.delayed(const Duration(milliseconds: 900), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const AdminHomePage()));
    });
  }

  openLoginPage() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()));
    });
  }

  String usersDisplayName() {
    return FirebaseAuth.instance.currentUser!.displayName!.toString();
  }

  Widget helloText() {
    return Text(
      'Hello! ${usersDisplayName()}',
      style: GoogleFonts.openSans(
        fontSize: 17,
      ),
    );
  }

  Widget loading() {
    return SpinKitWave(
      size: 40,
      itemBuilder: (BuildContext context, int index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 244, 197, 54),
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
