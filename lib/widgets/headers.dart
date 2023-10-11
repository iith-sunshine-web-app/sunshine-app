import 'package:flutter/material.dart';

class Headers extends StatelessWidget {
  final String title;
  const Headers({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
          wordSpacing: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
