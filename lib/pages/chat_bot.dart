import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  int _timerCount =5;
  Timer? timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    Timer.periodic( const Duration(seconds: 1), (timer) {
      if (_timerCount > 0) {
        setState(() {
          _timerCount--;
        });
      } else {
        timer.cancel();
        Navigator.pop(context);
        // Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>const HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff2b545) ,
          toolbarHeight: 0.0,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/chatbot.png'),
          const SizedBox(height: 10,),
          Text(
            'Sunshine chat bot',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.w500,
                fontSize: 26,
              ),
            ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              'This functionality is under development...',
              textAlign: TextAlign.center,
              // style: GoogleFonts.robo,
              style: GoogleFonts.inconsolata(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
          ),

          const SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              'Redirecting you to HomePage in $_timerCount seconds',
              textAlign: TextAlign.center,
              // style: GoogleFonts.robo,
              style: GoogleFonts.inconsolata(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )

        ],
      ),
    );
  }
}