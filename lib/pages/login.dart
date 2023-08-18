import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunshine_iith/pages/home.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: LoginScreen(),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          const SizedBox(height: 60.0),
          ElevatedButton(
            onPressed: () {
              // Add your Google login logic here
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              backgroundColor: Colors.orange[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15,00,15,0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/GoogleIcon.svg',
                    height: 20.0,
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    'Continue with Google',
                    style: TextStyle(fontSize: 17.0,
                    color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
