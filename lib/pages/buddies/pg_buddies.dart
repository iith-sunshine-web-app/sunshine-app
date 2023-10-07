import 'package:flutter/material.dart';
import 'package:sunshine_iith/widgets/headers.dart';

class PgBuddies extends StatelessWidget {
  const PgBuddies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Headers(title: 'PG Buddies'),
    );
  }
}