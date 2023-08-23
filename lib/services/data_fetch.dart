import 'package:firebase_database/firebase_database.dart';

class DataFetch{
  static DatabaseReference dataFromRTDB(String pos){
    final FirebaseDatabase db = FirebaseDatabase.instance;
    DatabaseReference refTeam = db.ref().child('team-data');
    DatabaseReference finalRef = refTeam.child(pos);
    return finalRef;
  }

  static List getData(String pos,String need){
    final FirebaseDatabase db = FirebaseDatabase.instance;
    DatabaseReference refTeam = db.ref().child('team-data');
    DatabaseReference finalRef = refTeam.child(pos);
    List list = [];
    
    finalRef.onValue.listen((event) {
      final data = event.snapshot.children;

      for(int i=0;i<data.length ; i++){
        final temp = event.snapshot.child('$i').child(need);
        list.add(temp.value.toString());
      }
    });
    return list;

  }

}