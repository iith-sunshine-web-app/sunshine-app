import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sunshine_iith/services/rtdb_database.dart';
import 'package:sunshine_iith/widgets/team_data_widget.dart';

class ExpansionPanelFacultyRep extends StatefulWidget {
  // String pos;
  const ExpansionPanelFacultyRep({super.key,});

  @override
  State<ExpansionPanelFacultyRep> createState() => _ExpansionPanelFacultyRepState();
}

class _ExpansionPanelFacultyRepState extends State<ExpansionPanelFacultyRep> {
List departmentList = [];
List departmentCODEList = [];
  @override
  void initState()  {
    departmentList =  DataFetch.getData('faculty-rep', 'department');
    departmentCODEList = DataFetch.getData('faculty-rep', 'code');
    super.initState();
  }
  // List departmentList = DataFetch.getData('faculty-rep', 'department');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding:  EdgeInsets.fromLTRB(10, 25, 10, 25),
                child:  Text(
                  "FACULTY REPRESENTATIVES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    wordSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),


            Expanded(
              child: FirebaseAnimatedList(
                query: DataFetch.dataFromRTDB('faculty-rep'), 
                itemBuilder: (context,snapshot,animation,index){
                  return ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment:  MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(255, 240, 167, 32),
                            child: Text(departmentCODEList.elementAt(index)),
                          ),
            
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                              child: Text(departmentList.elementAt(index),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                      children: [
                        DataShowingWidget(
                            facRep: true,
                            name: snapshot.child('name').value.toString(), 
                            email: snapshot.child('email').value.toString(), 
                            phone: snapshot.child('phone').value.toString(), 
                            position: snapshot.child('position').value.toString(), 
                            imageLink: snapshot.child('image').value.toString()
                      ),
                      ],
                    );
                }
                ),
            ),
          ],
        ),
      ),
    );
  }

}









// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:sunshine_iith/services/data_fetch.dart';
// import 'package:sunshine_iith/widgets/team_data_widget.dart';

// class DepartmentData{
//   bool isExpanded;
//   String code;
//   String branch;
//   DepartmentData({this.isExpanded = false , required this.code , required this.branch});
// }

// class ExpansionPanelFacultyRep extends StatefulWidget {
//   // String pos;
//   const ExpansionPanelFacultyRep({super.key,});

//   @override
//   State<ExpansionPanelFacultyRep> createState() => _ExpansionPanelFacultyRepState();
// }

// class _ExpansionPanelFacultyRepState extends State<ExpansionPanelFacultyRep> {
// // List departmentList = [  , "Biomedical Engineering", " Biotechnology "," Chemical Engineering ",
// //           "Climate Change"," Chemistry "," Civil Engineering ", " Computer Science and Engineering ", " Design ",
// //           " Electrical Engineering ","Engineering Science "," Entrepreneurship and Management ", " Liberal Arts ",
// //           " Materials Science and Metallurgical Engineering ", " Mechanical and Aerospace Engineering ", " Mathematics "," Physics ",
// //       ];

// // List<String> departmentCODEList = [ 'AI', 'BM', 'BT', 'CH', 'CC', 'CY' , 'CE', 'CS', 'D' , 'EE','ES','EM','LA','MS','ME','MA','PH'];

//   List<DepartmentData> data = [
//     DepartmentData(branch : "Artificial Intelligence", code : 'AI'),
//     DepartmentData(branch : "Biomedical Engineering", code : 'BM'),
//     DepartmentData(branch : "Biotechnology", code : 'BT'),
//     DepartmentData(branch : "Chemical Engineering", code : 'CH'),
//     DepartmentData(branch : "Climate Change", code : 'CC'),
//     DepartmentData(branch : "Chemistry", code : 'CY'),
//     DepartmentData(branch : "Civil Engineering", code : 'CE'),
//     DepartmentData(branch : "Computer Science and Engineering ", code : 'CS'),
//     DepartmentData(branch : "Design", code : 'D'),
//     DepartmentData(branch : "Electrical Engineering", code : 'EE'),
//     DepartmentData(branch : "Engineering Science", code : 'ES'),
//     DepartmentData(branch : "Entrepreneurship and Management ", code : 'EM'),
//     DepartmentData(branch : "Liberal Arts ", code : 'LA'),
//     DepartmentData(branch : "Liberal Arts ", code : 'LA'),
//     DepartmentData(branch : "Mechanical and Aerospace Engineering", code : 'ME'),
//     DepartmentData(branch : "Materials Science and Metallurgical Engineering", code : 'MS'),
//     DepartmentData(branch : "Mathematics", code : 'MA'),
//     DepartmentData(branch : "Physics", code : 'PH'),
//   ];

//   // @override
//   // void initState()  {
//   //   departmentList =  DataFetch.getData('faculty-rep', 'department');
//   //   departmentCODEList = DataFetch.getData('faculty-rep', 'code');
//   //   super.initState();
//   // }
//   // List departmentList = DataFetch.getData('faculty-rep', 'department');

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: Colors.white,
//         //   centerTitle: true,
//         //   toolbarHeight: 80,
//         //   automaticallyImplyLeading: false,
//         //   title: const Text(
//         //     'FACULTY REPRESENTATIVES',
//         //         style: TextStyle(
//         //           fontSize: 20,
//         //           wordSpacing: 1.5,
//         //           fontWeight: FontWeight.w500,
//         //         ),
//         //   ),
//         // ),
//         body: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               const Padding(
//                 padding:  EdgeInsets.fromLTRB(10, 25, 10, 25),
//                 child:  Text(
//                   "FACULTY REPRESENTATIVES",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 24,
//                     wordSpacing: 1.5,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),

// /*
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: data.length,
                  
//                   itemBuilder: (context,i){
//                     return ExpansionPanelList(
//                         expansionCallback: (panelIndex, isExpanded) {
//                           setState(() {
//                             data[i].isExpanded = !isExpanded;
//                           });
//                         },
//                         children: [
//                           ExpansionPanel(
//                             headerBuilder: (context, isExpanded) {
//                               return Padding(
//                                 padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
//                                 child: Row(
//                                 // crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 mainAxisAlignment:  MainAxisAlignment.start,
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundColor: const Color.fromARGB(255, 240, 167, 32),
//                                     child: Text(data[i].code),
//                                   ),
//                                   Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
//                                     child: Text(data[i].branch,
//                                   ),
//                                   ),
//                                   ),
//                                 ],
                                
//                             ),
//                             );
//                             },
//                             // body: Text(data[index].branch),
//                             body: FirebaseAnimatedList(
//                                   query: DataFetch.dataFromRTDB('faculty-rep').child('MS'),
//                                   itemBuilder: (context, snapshot, animation, index) {
//                                     return  DataShowingWidget(
//                                             facRep: true,
//                                             name: snapshot.child('name').value.toString(), 
//                                             email: snapshot.child('email').value.toString(), 
//                                             phone: snapshot.child('phone').value.toString(), 
//                                             position: snapshot.child('position').value.toString(), 
//                                             imageLink: snapshot.child('image').value.toString()
//                                         );
//                                   },
//                             ),
//                             isExpanded: data[i].isExpanded,
//                           )
//                         ],
                        
//                     );
//                   }))
// */

//             Expanded(
//               child: ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   return Expanded(
//                   child: FirebaseAnimatedList(
//                     query: DataFetch.dataFromRTDB('faculty-rep'), 
//                     itemBuilder: (context,snapshot,animation,i){
//                       return ExpansionTile(
//                         title: Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
//                           child: Row(
//                             // crossAxisAlignment: CrossAxisAlignment.stretch,
//                             mainAxisAlignment:  MainAxisAlignment.start,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: const Color.fromARGB(255, 240, 167, 32),
//                                 child: Text(data[i].code),
//                               ),
                
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
//                                   child: Text(data[i].branch,
//                                   ),
//                                 ),
//                               ),
                              
//                             ],
//                           ),
//                         ),
//                           children: [
//                             DataShowingWidget(
//                                 facRep: true,
//                                 name: snapshot.child('name').value.toString(), 
//                                 email: snapshot.child('email').value.toString(), 
//                                 phone: snapshot.child('phone').value.toString(), 
//                                 position: snapshot.child('position').value.toString(), 
//                                 imageLink: snapshot.child('image').value.toString()
//                           ),
//                           ],
//                         );
//                     }
//                     ),
//                 );
//                 },
                
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }