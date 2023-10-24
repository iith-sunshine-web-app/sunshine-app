import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoom extends ConsumerStatefulWidget {
  final String? userImage;
  const ChatRoom({super.key, this.userImage});

  @override
  ConsumerState<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends ConsumerState<ChatRoom> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  scrollToBottom() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // Spacer(),
          _bodyWidget(width),
          _bootmWidget()
        ],
      )),
    );
  }

  Widget _bodyWidget(double width) {
    return Expanded(
        child: Container(
      child: ListView.builder(
          controller: scrollController,
          itemCount: 4,
          itemBuilder: (ctx, index) {
            return messageWidget(1, 'Hello how are you?', width);
          }),
    ));
  }

  Widget messageWidget(int who, String text, double width) {
    //who==0 -> bot , 1 -> user
    String photoURL = widget.userImage ??
        'https://firebasestorage.googleapis.com/v0/b/sunshine-iith-newapp.appspot.com/o/default_profile.png?alt=media&token=ddccfbd3-f02c-4f20-918c-bbc143953479&_gl=1*zaiiha*_ga*NDIzMTA3NTU2LjE2OTU1ODYxNTY.*_ga_CW55HF8NVT*MTY5ODE4MDg5Mi4zNS4xLjE2OTgxODA5NDcuNS4wLjA.';
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: Row(
        mainAxisAlignment:
            who == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          who == 0
              ? const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/robot.png'),
                  radius: 14,
                )
              : Container(),
          Flexible(
            child: Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                    color: who == 1
                        ? const Color(0xff397c31).withOpacity(0.7)
                        : const Color(0xff474d66).withOpacity(0.7),
                    borderRadius: who == 0
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))
                        : const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                      color: Colors.white, fontSize: 16, letterSpacing: -0.2),
                )),
          ),
          who == 1
              ? CircleAvatar(
                  backgroundImage: NetworkImage(photoURL),
                  radius: 14,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _bootmWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange.shade100.withOpacity(0.4),
            borderRadius: BorderRadius.circular(25)),
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Ask something...",
                hintStyle: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 4),
            child: IconButton(
              splashColor: Colors.transparent,
                icon: const Icon(Icons.send_rounded, color: Colors.blue, size: 40),
                onPressed: () {
                  controller.clear();
                }),
          )
        ]),
      ),
    );
  }
}

// class BottomBar extends StatefulWidget {
//   const BottomBar({super.key});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   TextEditingController textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//       child: TextField(
//         controller: textEditingController,
//         keyboardType: TextInputType.text,
//         textInputAction: TextInputAction.done,
//         decoration: InputDecoration(
//             hintText: 'Ask something...',
//             // border: OutlineInputBorder(
//             //   // borderRadius: BorderRadius.circular(50),
//             // ),

//             suffixIcon: IconButton(
//               splashColor: Colors.transparent,
//               onPressed: (){}, 
//               icon: Icon(Icons.send,color: Colors.blue,)),
//         // onChanged: (value) {
//         //   showError = false;
//         // },
//       ),
//     ));
//   }
// }
