import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sunshine_iith/services/session_data.dart';

class FirestoreData{
  static Future<List> getData(String pos,String type) async{
    List dataList=[];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var documentSnapshot =
      await firestore.collection('data').doc(type).get();
      if(documentSnapshot.data()!.containsKey(pos)){
        dataList = documentSnapshot.data()![pos];
        
      }
    return dataList;
  } 

static Future<List> getSpecificData(String dataType,String pos) async{
    List dataList=[];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var documentSnapshot =
      await firestore.collection('data').doc(dataType).get();
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


static Future<void> addData(SessionData data, String counsellor, String date) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Get a reference to the 'data' collection and the document 'team-data'
    CollectionReference dataCollection = firestore.collection('$counsellor-sessions');
    DocumentReference documentRef = dataCollection.doc(date);

    // Get the current data in the document
    DocumentSnapshot documentSnapshot = await documentRef.get();
    Map<String, dynamic> currentData = documentSnapshot.data() as Map<String, dynamic>? ?? {};

    // Determine the next index based on the current data's length
    int nextIndex = currentData.length;

    // Update the data for the given index
    currentData[nextIndex.toString()] = data.toMap();

    // Set the updated data back to the document
    await documentRef.set(currentData);

    print('$data added successfully at $nextIndex');
  } catch (e) {
    print('Error adding data: $e');
  }
}




}