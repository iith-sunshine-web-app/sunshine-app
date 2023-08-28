// import 'package:flutter/material.dart';
// import 'package:sunshine_iith/pages/loading_splash.dart';
// import 'package:sunshine_iith/services/data_fetch.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   bool isLoggedIn=false;

//   openLoadingPage(){
    
//       Future.delayed(const Duration(milliseconds: 1500),(){
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (_)=>const LoadingSplash() ));
//       });
    

    
//   }

//   @override
//   void initState() {
    
//     super.initState();
//     openLoadingPage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('assets/images/sunshine_logo.png',
//               height: 220,),

//               const SizedBox(height: 70.0,),

//               // Text(
//               //   'SUNSHINE'
//               // )
//             ],
//           ),
//         ),

//       ),
//     );
//   }
// }