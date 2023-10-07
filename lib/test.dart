// import 'package:flutter/material.dart';
// import 'package:sunshine_iith/services/data_model.dart';
// import 'package:sunshine_iith/services/firestore_data.dart';

// class AddData extends StatefulWidget {
//   const AddData({super.key});

//   @override
//   State<AddData> createState() => _AddDataState();
// }

// class _AddDataState extends State<AddData> {

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     List<String> branchCode = [
//       'ai','bm','bt','ch','cc','cy','ce','cs','d','ee','es','em','la','ms','ma','me','ph'
//     ];
//     branchCode.sort();
//     print(branchCode);
//   }
  
//   void addData(String pos,int times){
//     List<DataModel> model = [];
    

    
//     for(int i=0;i<times;i++){
//       model.add(DataModel(name: 'a', email: 'a', phone: 'a', image: 'a', position: 'a'));
      
//     }

//     FirestoreData.addData(pos, model);

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
//             decoration: InputDecoration(
//               hintText: 'times'
//             ),
            
//             controller: textEditingController,
            
//           ),
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'pos'
//             ),
            
//             controller: textEditingController2,
            
//           ),
//           ElevatedButton(onPressed: (){
            
//             // addData(textEditingController2.text.toString(), int.parse(textEditingController.text.toString()));
//           }, child: Text('ADD'))
//         ],
//       ),
//     );
//   }
// }