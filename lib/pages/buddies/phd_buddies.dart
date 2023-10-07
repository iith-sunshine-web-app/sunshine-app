import 'package:flutter/material.dart';
import 'package:sunshine_iith/widgets/headers.dart';

class PhDBuddies extends StatelessWidget {
  const PhDBuddies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Headers(title: 'PhD Buddies'),
    );
  }
}