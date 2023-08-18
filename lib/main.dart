import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/home.dart';
import 'package:sunshine_iith/pages/login.dart';

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
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginPage(),
      routes: {
        '/' : (context) => LoginPage(),
        '/home' : (context) => HomePage(),
      },
      initialRoute: '/',
    );
  }
}

