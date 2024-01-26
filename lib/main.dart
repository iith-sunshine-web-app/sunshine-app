import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunshine_iith/firebase_options.dart';
import 'package:sunshine_iith/pages/loading_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//Color(0xfff2b545)
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sunshine IITH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 244, 197, 54),
            primary: const Color(0xfff2b545)),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 280.0,
        nextScreen: const LoadingSplash(),
        duration: 1800,
        splash: 'assets/images/sunshine_logo.png',
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
      ),
    );
  }
}
