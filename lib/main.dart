import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/firebase_options.dart';
import 'package:sunshine_iith/pages/loading_splash.dart';
import 'package:sunshine_iith/widgets/expansion_tile.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xfff2b545),
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Sunshine IITH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 244, 197, 54) , primary: const Color(0xfff2b545)),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 180.0,
        nextScreen: const LoadingSplash(),
        duration: 1800,
        splash: 'assets/images/sunshine_logo.png',
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        
        ),
      // home: ExpansionPanelWidget(),

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

