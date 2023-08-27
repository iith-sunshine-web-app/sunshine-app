import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sunshine_iith/services/data_model.dart';

class FirestoreData{
  static Future<List> getData(String pos) async{
    List dataList=[];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var documentSnapshot =
      await firestore.collection('data').doc('team-data').get();
      if(documentSnapshot.data()!.containsKey(pos)){
        dataList = documentSnapshot.data()![pos];
        
      }

      print(dataList[0]['code']);
      

    return dataList;
  } 

  static managementTeamData(String team) async{
    List dataList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var snapshot = await firestore.collection('data').doc('team-data').get();
    var list = snapshot.data()!['management-team'][team];
    print(list);
  }

  // teamData(DocumentSnapshot documentSnapshot){
  //   var list = documentSnapshot.
  // }

}