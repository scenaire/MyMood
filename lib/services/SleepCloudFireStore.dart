import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymood/Models/Sleep.dart';

class SleepCloudFireStore {

  final String uid;

  SleepCloudFireStore({this.uid});

  final CollectionReference sleepCollection = Firestore.instance.collection("User");

  // ADD

  Future addSleeptoUser (Sleep sleep) async {

    try {
      await sleepCollection
      .document(uid)
      .collection('sleepList')
      .add({
        'create_date' : sleep.getCreateDate,
        'start_sleep' : sleep.getSleepTime,
        'wake_up' : sleep.getWakeUp,
        'calculate_sleep_time' : sleep.getCalculateSleepTime
      });

      return true;
    } catch (e) {
      print(e.toString());
    }

    return null;

  }

  Future <List<Sleep>> retriveSleepData() async {

    QuerySnapshot snapshot = await sleepCollection
    .document(uid)
    .collection('sleepList')
    .getDocuments();

    List<Sleep> _sleepList = [];

    snapshot.documents.forEach((document) {
      _sleepList.add(new Sleep(createDate: document['create_date'].toDate(), sleep: document['start_sleep'].toDate(), wakeUp: document['wake_up'].toDate(), calculateSleepTime: document['calculate_sleep_time']));
    });

    return sortListByDateTime(_sleepList);

  }

  Future <List<Sleep>> retriveSleepDataFB() async {

    QuerySnapshot snapshot = await sleepCollection
    .document(uid)
    .collection('sleepList')
    .getDocuments();

    List<Sleep> _sleepList = [];

    snapshot.documents.forEach((document) {
      _sleepList.add(new Sleep(createDate: document['create_date'].toDate(), sleep: document['start_sleep'].toDate(), wakeUp: document['wake_up'].toDate(), calculateSleepTime: document['calculate_sleep_time']));
    });

    return sortListByDateTime(_sleepList);

  }

  List<Sleep> sortListByDateTime(List<Sleep> list) {
    list.sort(
      (b, a) => a.getCreateDate.compareTo(b.getCreateDate)
    );
    return list;
  }

  List<Sleep> sortListByDateTimeFB(List<Sleep> list) {
    list.sort(
      (a, b) => a.getCreateDate.compareTo(b.getCreateDate)
    );
    return list;
  }

}