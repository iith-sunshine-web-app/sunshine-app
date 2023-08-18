import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/home.dart';
import 'package:sunshine_iith/pages/login.dart';
import 'package:sunshine_iith/pages/teams.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunshine IITH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange , primary: Colors.orange,secondary: Colors.orange),
        useMaterial3: true,
      ),
      // home: TeamPage(),
      routes: {
        '/' : (context) => LoginPage(),
        '/home' : (context) => const HomePage(),
      },
      initialRoute: '/',
    );
  }
}

