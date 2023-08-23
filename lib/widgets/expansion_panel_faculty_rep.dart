import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sunshine_iith/services/data_fetch.dart';
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
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   toolbarHeight: 80,
        //   automaticallyImplyLeading: false,
        //   title: const Text(
        //     'FACULTY REPRESENTATIVES',
        //         style: TextStyle(
        //           fontSize: 20,
        //           wordSpacing: 1.5,
        //           fontWeight: FontWeight.w500,
        //         ),
        //   ),
        // ),
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