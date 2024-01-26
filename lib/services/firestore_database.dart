import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sunshine_iith/services/session_data.dart';

class FirestoreData {
  static Future<List> getData(String pos, String type) async {
    List dataList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var documentSnapshot = await firestore.collection('data').doc(type).get();
    if (documentSnapshot.data()!.containsKey(pos)) {
      dataList = documentSnapshot.data()![pos];
    }
    return dataList;
  }

  static Future<List> getSpecificData(String dataType, String pos) async {
    List dataList = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var documentSnapshot =
        await firestore.collection('data').doc(dataType).get();
    if (documentSnapshot.data()!.containsKey(pos)) {
      dataList = documentSnapshot.data()![pos];
    }
    return dataList;
  }

  static Future<void> addData(
      SessionData data, String counsellor, String date) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Get a reference to the 'data' collection and the document 'team-data'
      CollectionReference dataCollection =
          firestore.collection('$counsellor-sessions');
      DocumentReference documentRef = dataCollection.doc("pg-buddy");

      // Get the current data in the document
      DocumentSnapshot documentSnapshot = await documentRef.get();
      Map<String, dynamic> currentData =
          documentSnapshot.data() as Map<String, dynamic>? ?? {};

      // Determine the next index based on the current data's length
      int nextIndex = currentData.length;

      // Update the data for the given index
      currentData[nextIndex.toString()] = data.toMap();

      // Set the updated data back to the document
      await documentRef.set(currentData);

    } catch (e) {
      debugPrint('Error adding data: $e');
    }
  }
}
