import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunshine_iith/chatbot/chatroom.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 244, 197, 54),
                primary: const Color.fromARGB(255, 21, 101, 192)),
            useMaterial3: true,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/chatbot.png'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sunshine chat bot',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  'The Sunhine chat bot is intended to be an interactive and user friendly source of campus information. You can ask the bot a variety of queries ranging from the clubs at IITH to emergency contacts on campus. The chat bot will ty its best to answer your queries. In case its unable to, you can always reach out to us, your Sunshine buddies and mentors.',
                  textAlign: TextAlign.center,
                  // style: GoogleFonts.robo,
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 21, 101, 192),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => const ChatRoom())));
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      'START CONVERSTATION',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                          letterSpacing: 1.2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
