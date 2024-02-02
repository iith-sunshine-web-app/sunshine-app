import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class EmergencyContacts extends StatelessWidget {
  const EmergencyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        // centerTitle: true,
        title: const Text(
          'Emergency Contacts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.1,
          ),
        ),
        backgroundColor: const Color.fromARGB(228, 99, 99, 99),
      ),
      backgroundColor: const Color.fromARGB(228, 99, 99, 99),
      body: Center(
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(
            color: Color.fromARGB(228, 99, 99, 99)
          ),
          imageProvider: const AssetImage("assets/images/emergency.png")
        ),
      ),
    );
  }
}
