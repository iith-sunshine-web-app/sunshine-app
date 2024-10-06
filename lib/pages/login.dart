import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sunshine_iith/admin/home_page_admin.dart';
import 'package:sunshine_iith/pages/home.dart';
import 'package:sunshine_iith/providers/null_provider_logout.dart';
import 'package:sunshine_iith/widgets/custom_route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: const Center(
        child: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  Future<bool> checkLoggedIn() {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    return googleSignIn.isSignedIn();
  }

  Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await auth.signInWithCredential(credential);
      }
    } catch (error) {
      _showSnackBar('Failed to sign in with Google.');
    }
  }

  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    NullProviderAfterLogout().nullAfterLogout(ref);
    await googleSignIn.signOut();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void isLoggedIn() async {
    bool isLoggedIn = await checkLoggedIn();
    if (isLoggedIn) {
      if (mounted) {
        Navigator.pushReplacement(
            context, CustomPageRoute(child: const HomePage()));
      }
    }
  }

  List<String> adminEmails = [
    'maria.morris@admin.iith.ac.in',
    'yukti.rastogi@admin.iith.ac.in',
    'phani.bhushan@admin.iith.ac.in',
    'ms22btech11010@iith.ac.in',
  ];

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
            onPressed: () async {
              await signInWithGoogle();

              bool isLoggedIn = await checkLoggedIn();
              if (isLoggedIn) {
                var email = FirebaseAuth.instance.currentUser!.email.toString();

                if (email.isEmpty) {
                  await logout();
                  _showSnackBar('Erorr!');
                } else if (email.contains('iith.ac.in')) {
                  if (mounted) {
                    if (adminEmails.contains(email)) {
                      email = "";
                      Navigator.pushReplacement(context,
                          CustomPageRoute(child: const AdminHomePage()));
                    } else {
                      email = "";
                      Navigator.pushReplacement(
                          context, CustomPageRoute(child: const HomePage()));
                    }
                  }
                } else {
                  await logout();
                  _showSnackBar('Please Login with IITH email-Id');
                }
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              backgroundColor: Colors.orange[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 00, 15, 0),
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
                    style: TextStyle(fontSize: 17.0, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          // InkWell(
          //   onTap: () {
          //     ref.read(isGuestProvider.notifier).state = true;
          //     Navigator.pushAndRemoveUntil(context,
          //         CustomPageRoute(child: const HomePage()), (route) => false);
          //   },
          //   child: const Text(
          //     "Continue as a Guest",
          //     style: TextStyle(
          //         color: Colors.black87,
          //         fontSize: 14,
          //         decorationColor: Colors.black87,
          //         decoration: TextDecoration.underline),
          //   ),
          // )
        ],
      ),
    );
  }
}