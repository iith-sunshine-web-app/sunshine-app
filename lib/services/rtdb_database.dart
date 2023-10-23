import 'package:firebase_database/firebase_database.dart';
import 'package:sunshine_iith/services/session_data.dart';


class RealTimeDB {
  Future<Map<String, dynamic>> getAppointmentList(String uid) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    try {
      DatabaseEvent event =
          await databaseReference.child('sessions').child(uid).orderByChild('time').once();

      DataSnapshot dataSnapshot = event.snapshot;

      if (dataSnapshot.value != null) {
        Map<String, dynamic> sessionsData =
            Map<String, dynamic>.from(dataSnapshot.value as Map);
        return sessionsData;
      } else {
        return {};
      }
    } catch (error) {
      print('Error fetching appointment list data: $error');
      return {};
    }
  }

  Future<Map<String, dynamic>> getCounsellorsSessionsData(
      String name, String date) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    if (name.contains('.')) {
      name = 'Phani Bhushan';
    }
    String convoDate = convertDateFormat(date);

    try {
      DatabaseEvent event = await databaseReference
          .child(name)
          .child('sessions')
          .child(convoDate)
          .once();

      DataSnapshot dataSnapshot = event.snapshot;

      if (dataSnapshot.value != null) {
        Map<String, dynamic> sessionsData =
            Map<String, dynamic>.from(dataSnapshot.value as Map);
        return sessionsData;
      } else {
        return {};
      }
    } catch (error) {
      print('Error fetching counsellor sessions data: $error');
      return {};
    }
  }

  void addSessionData(SessionData data,) {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    // DatabaseReference sessionReference =
    //     databaseReference.child('sessions').child(uid).push();

    String date = convertDateFormat(data.date);
    String counsellor = data.counsellorsName;
    if (data.counsellorsName.contains('.')) {
      counsellor = 'Phani Bhushan';
    }
    DatabaseReference counsellorReference = databaseReference
        .child(counsellor)
        .child('sessions')
        .child(date)
        .push();

    Map<String, dynamic> sessionDataMap = data.toMap();

    // sessionReference.set(sessionDataMap).then((_) {
    //   print('Session data uploaded to sessions successfully');
    // }).catchError((error) {
    //   print('Error uploading session data: $error');
    // });

    counsellorReference.set(sessionDataMap).then((_) {
      print('Session data uploaded to counsellors reference successfully');
    }).catchError((error) {
      print('Error uploading session data: $error');
    });
  }

  String convertDateFormat(String inputDate) {
    // Split the input date string using '/'
    List<String> dateParts = inputDate.split('/');

    if (dateParts.length == 3) {
      // Join the parts with hyphens
      String convertedDate = '${dateParts[0]}-${dateParts[1]}-${dateParts[2]}';
      return convertedDate;
    } else {
      // Invalid date format
      return 'Invalid Date';
    }
  }
}
