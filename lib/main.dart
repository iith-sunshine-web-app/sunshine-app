import 'package:flutter/material.dart';
import 'package:sunshine_iith/pages/home.dart';
import 'package:sunshine_iith/pages/login.dart';
import 'package:sunshine_iith/pages/sunshine_teams.dart';
import 'package:sunshine_iith/widgets/team_data_list_view.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red , primary: Colors.red,secondary: Colors.red),
        useMaterial3: true,
      ),
      home: DataShowingList(),
      // home: DataShowingWidget(name: 'Bhaskar Mandal', phone: '9647598624', position: 'App-Web Dev Team',email: 'ms22btech11010@iith.ac.in',imageLink: 'https://media.licdn.com/dms/image/D4D03AQH5hluDGyJmRg/profile-displayphoto-shrink_800_800/0/1689757969646?e=2147483647&v=beta&t=fRwpAbHJ-7meh6Fmi1UzaT-sbnJMxyhOZxdnLV4LyzY' ,),
      // routes: {
      //   '/login' : (context) => LoginPage(),
      //   '/home' : (context) => const HomePage(),
      //   '/' :(context) => TeamPage(),
      // },
      // initialRoute: '/',
    );
  }
}

