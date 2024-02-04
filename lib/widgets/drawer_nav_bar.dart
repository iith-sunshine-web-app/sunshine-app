import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:open_share_plus/open.dart';
import 'package:sunshine_iith/pages/emergency_contacts.dart';
import 'package:sunshine_iith/pages/login.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/widgets/custom_route.dart';

class NavBar extends ConsumerStatefulWidget {
  const NavBar({super.key});

  @override
  ConsumerState<NavBar> createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  String userName = 'Guest-User';
  String email = '';
  String image =
      'https://firebasestorage.googleapis.com/v0/b/sunshine-iith-newapp.appspot.com/o/default_profile.png?alt=media&token=ddccfbd3-f02c-4f20-918c-bbc143953479';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    if (!ref.read(isGuestProvider)) {
      setState(() {
        userName = FirebaseAuth.instance.currentUser!.displayName!;
        email = FirebaseAuth.instance.currentUser!.email!;
        image = FirebaseAuth.instance.currentUser!.photoURL!;
      });
    }
  }

  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      // shape: CircleBorder(eccentricity: 3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ListTile(
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: ref.read(isGuestProvider)
                      ? Image.asset("assets/images/default_profile.png")
                      : Image.network(image),
                ),
              ),
              accountName: Text(
                userName,
                style: GoogleFonts.robotoMono(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.05,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                email,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                ),
              ),
              decoration: const BoxDecoration(
                color: Color(0xfff2b545),
              ),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.earthAmericas),
              title: const Text(
                'Our Website',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Open.browser(
                  url: "https://sunshine.iith.ac.in",
                  mode: OpenMode.externalApplication,
                );
              },
            ),

            ListTile(
              leading: const FaIcon(Icons.forum_outlined),
              title: const Text(
                'FAQs',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Open.browser(
                  url: "https://sunshine.iith.ac.in/faqs",
                  mode: OpenMode.externalApplication,
                );
              },
            ),

            ListTile(
              leading: const FaIcon(FontAwesomeIcons.circleQuestion),
              title: const Text(
                'About Us',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Open.browser(
                  url: "https://sunshine.iith.ac.in/aboutus",
                  mode: OpenMode.externalApplication,
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.contact_emergency_outlined),
              title: const Text(
                'Emergency Contacts',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.push(
                    context, CustomPageRoute(child: const EmergencyContacts()));
              },
            ),

            ref.watch(isGuestProvider)
                ? ListTile(
                    leading: const Icon(Icons.login_outlined),
                    title: const Text(
                      'Sign In',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      ref.read(isGuestProvider.notifier).state = false;
                      Navigator.pushAndRemoveUntil(
                          context,
                          CustomPageRoute(
                              child: const LoginPage(), startPos: const Offset(0, 1)),
                          (route) => false);
                    },
                  )
                : ListTile(
                    leading:
                        const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                    title: const Text(
                      'Sign Out',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                                'Are you sure you want to sign out?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'No'),
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await logout();

                                  Future.delayed(
                                      const Duration(microseconds: 0), () {
                                    Navigator.pop(context, 'Yes');
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => const LoginPage()));
                                  });
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
