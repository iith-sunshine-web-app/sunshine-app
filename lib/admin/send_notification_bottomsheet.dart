// import 'package:flutter/material.dart';

// class SendNotificationBottomsheet extends StatefulWidget {
//   const SendNotificationBottomsheet({super.key});

//   @override
//   State<SendNotificationBottomsheet> createState() => _SendNotificationBottomsheetState();
// }

// class _SendNotificationBottomsheetState extends State<SendNotificationBottomsheet> {
//   TextEditingController textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: SingleChildScrollView(
//         child: Theme(
//             data: ThemeData(
//             colorScheme: ColorScheme.fromSeed(
//                 seedColor: const Color.fromARGB(255, 244, 197, 54),
//                 primary: const Color.fromARGB(255, 21, 101, 192)),
//             useMaterial3: true,
//           ),
//           child: Column(
//             children: [
//               const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade400,
//                     borderRadius: BorderRadius.circular(150),
//                   ),
//                   height: 6,
//                   width: 60,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 16),
//                   child: Text(
//                     'Send Event Notification',
//                     style: TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40,),
        
            
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
//                   child: TextField(
//                     controller: textEditingController,
//                     keyboardType: TextInputType.text,
//                     textInputAction: TextInputAction.done,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Title',
//                       prefixIcon: const Icon(
//                         Icons.title,
//                         color: Colors.orange,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                             const BorderSide(color: Colors.orange, width: 1.5),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                             const BorderSide(color: Colors.orange, width: 1.5),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                             const BorderSide(color: Colors.orange, width: 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
//                   child: TextField(
//                     controller: textEditingController,
//                     keyboardType: TextInputType.text,
//                     textInputAction: TextInputAction.done,
//                     decoration: InputDecoration(
//                       labelText: 'Enter Description',
//                       prefixIcon: const Icon(
//                         Icons.description_outlined,
//                         color: Colors.orange,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                             const BorderSide(color: Colors.orange, width: 1.5),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                             const BorderSide(color: Colors.orange, width: 1.5),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                             const BorderSide(color: Colors.orange, width: 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//                  const SizedBox(
//                   height: 20,
//                 ),
        
//                 button(MediaQuery.of(context).size.width * 0.8, 'Send Notification', () {
//                   print('Send Notification clicked');
//                 }),
//                 const SizedBox(
//                   height: 50,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget button(double width, String text, func) {
//     return SizedBox(
//       width: width,
//       height: 50,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 21, 101, 192),
//           elevation: 2,
//         ),
//         onPressed: () async {
//           func();
//         },
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//           child: Text(
//             text,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 18, letterSpacing: 1.2),
//           ),
//         ),
//       ),
//     );
//   }
// }