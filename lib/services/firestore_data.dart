import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreData{
  static Future<List> getData(String pos) async{
    List dataList=[];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var documentSnapshot =
      await firestore.collection('data').doc('team-data').get();
      if(documentSnapshot.data()!.containsKey(pos)){
        dataList = documentSnapshot.data()![pos];
        
      }
    return dataList;
  } 

  // static Future<Map<String, List<dynamic>>> managementTeamData() async{
  //   Map<String, List<dynamic>> dataList;
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   var snapshot = await firestore.collection('data').doc('team-data').get();
  //   dataList = snapshot.data()!['management-team'];

  //   return dataList;
  // }


}