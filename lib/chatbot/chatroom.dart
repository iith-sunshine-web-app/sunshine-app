import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunshine_iith/chatbot/chatbot.dart';
import 'package:sunshine_iith/pages/emergency_contacts.dart';
import 'package:sunshine_iith/providers/data_provider.dart';
import 'package:sunshine_iith/providers/message_provider.dart';
import 'package:sunshine_iith/widgets/custom_route.dart';

class ChatRoom extends ConsumerStatefulWidget {
  const ChatRoom({super.key});

  @override
  ConsumerState<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends ConsumerState<ChatRoom> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  scrollToBottom() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  sendWelcomeMessage() async {
    String sessionId = ref.read(sessionIdProvider)!;
    String response =
        await ChatBotService().sendMessage('Hello', sessionId) ?? "";
    ref.read(messageProvider.notifier).addMessage({"0": response});
  }

  sendQueries(String query) async {
    String sessionId = ref.read(sessionIdProvider)!;
    String response =
        await ChatBotService().sendMessage(query, sessionId) ?? "";
    ref.read(messageProvider.notifier).addMessage({"0": response});
  }

  @override
  void initState() {
    super.initState();
    if (ref.read(messageProvider).messages.isEmpty) {
      sendWelcomeMessage();
    }
  }

  String emergencyText =
      "You can find all the Emergency Contact Details,\nOpen HomePage -> Side Navbar -> Emergency Contacts";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.76;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Sunshine Chatbot",
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w400,
            letterSpacing: 1.1,
            color: Colors.black87,
          ),
        ),
        backgroundColor: const Color(0xfff2b545),
      ),
      body: SafeArea(
          child: Column(
        children: [_bodyWidget(width), _bootmWidget()],
      )),
    );
  }

  Widget _bodyWidget(double width) {
    List<Map<String, String>> messages = ref.watch(messageProvider).messages;
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
    return Expanded(
        child: ListView.builder(
            controller: scrollController,
            itemCount: messages.length,
            itemBuilder: (ctx, index) {
              String sender = messages.elementAt(index).entries.first.key;
              String value = messages.elementAt(index).entries.first.value;
              return messageWidget(sender, value, width);
            }));
  }

  Widget messageWidget(String who, String text, double width) {
    //who==0 -> bot , 1 -> user
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment:
            who == "0" ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          who == "0"
              ? const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/robot.png'),
                  radius: 14,
                )
              : Container(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: width,
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        color: who == "1"
                            ? const Color(0xff397c31).withOpacity(0.7)
                            : const Color(0xff474d66).withOpacity(0.7),
                        borderRadius: who == "0"
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))
                            : const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                      ),
                      child: SelectableText(
                        text,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                  ),
                  // Other widgets
                ],
              ),
              if (who == "0" && text == emergencyText)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CustomPageRoute(
                              child: const EmergencyContacts(),
                              startPos: const Offset(0, 1)));
                    },
                    borderRadius: BorderRadius.circular(36),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 2, 24, 2),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(36),
                          border: Border.all(color: Colors.orange)),
                      child: const Text(
                        "Open",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                )
            ],
          ),
          who == "1"
              ? const CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/default_profile.png"),
                  radius: 15.5,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _bootmWidget() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
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
              fillColor: Colors.orange.shade100.withOpacity(0.4),
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
              icon:
                  const Icon(Icons.send_rounded, color: Colors.blue, size: 40),
              onPressed: () {
                if (controller.text.toString().trim().isNotEmpty) {
                  String query = controller.text.toString().trim();
                  ref.read(messageProvider.notifier).addMessage({"1": query});
                  sendQueries(query);
                }
                controller.clear();
              }),
        )
      ]),
    );
  }
}
