// import 'package:flutter/material.dart';
// import 'package:sunshine_iith/services/data_model.dart';
// import 'package:sunshine_iith/services/firestore_database.dart';
// import 'package:sunshine_iith/services/session_data.dart';

// class AddData extends StatefulWidget {
//   const AddData({super.key});

//   @override
//   State<AddData> createState() => _AddDataState();
// }

// class _AddDataState extends State<AddData> {

//   @override
//   void initState() {
//     super.initState();
//     List<String> branchCode = [
//       'ai','bm','bt','ch','cc','cy','ce','cs','d','ee','es','em','la','ms','ma','me','ph'
//     ];
//     branchCode.sort();
//     print(branchCode);
//   }
  
//   void addData(String pos,int times){
    
//     SessionData data = SessionData(date: '15-06-2023', email: 'bh@aa45.com', name: 'Bhaskar', time: '9:00 AM');
//     FirestoreData.addData(data, 'maria', DateTime.now().day.toString());

//   }
  
//   TextEditingController textEditingController = TextEditingController();
//   TextEditingController textEditingController1 = TextEditingController();
//   TextEditingController textEditingController2 = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(
//             decoration: const InputDecoration(
//               hintText: 'times'
//             ),
            
//             controller: textEditingController,
            
//           ),
//           TextField(
//             decoration: const InputDecoration(
//               hintText: 'pos'
//             ),
            
//             controller: textEditingController2,
            
//           ),
//           ElevatedButton(onPressed: (){
            
//             addData(textEditingController2.text.toString(), int.parse(textEditingController.text.toString()));
//           }, child: Text('ADD'))
//         ],
//       ),
//     );
//   }
// }