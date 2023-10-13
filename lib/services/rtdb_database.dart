import 'package:firebase_database/firebase_database.dart';

import 'data_model.dart';

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

    static List<DataModel> fetchWholeData(String pos){
    var needList = {'name', 'email' , 'phone' , 'image' , 'position'};
    final FirebaseDatabase db = FirebaseDatabase.instance;
    DatabaseReference refTeam = db.ref().child('team-data');
    DatabaseReference finalRef = refTeam.child(pos);
    List<DataModel> list = [];
    finalRef.onValue.listen((event) {
      final data = event.snapshot.children;

      for(int i=0;i<data.length ; i++){
        list.add(
          DataModel(name: event.snapshot.child('$i').child(needList.elementAt(0)).value.toString(),
           email: event.snapshot.child('$i').child(needList.elementAt(1)).value.toString(),
          phone: event.snapshot.child('$i').child(needList.elementAt(2)).value.toString(),
          position: event.snapshot.child('$i').child(needList.elementAt(4)).value.toString(), 
          image: event.snapshot.child('$i').child(needList.elementAt(3)).value.toString()),
        );
      }
    }
    );

    return list;
  }

}