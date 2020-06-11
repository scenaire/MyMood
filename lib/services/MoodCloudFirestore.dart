//AUTHOR : Jiratchaya Yeeto

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymood/Models/Mood.dart';

class MoodCloudFirestore {

  final String uid;

  MoodCloudFirestore ({this.uid});

  final CollectionReference moodCollection = Firestore.instance.collection("User");


  // ADD 

    Future addMoodtoUser(Mood mood) async {
    
    try {
      await moodCollection
      .document(uid)
      .collection('moodList')
      .add({
        'mood' : mood.type,
        'time' : mood.time,
        'fav' : mood.fav,
        'message' : mood.message,
        'negative' : null,
        'suicide' : null,
      });
      
      return true;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  //GET

  Future<List<Mood>> retriveMoodData() async {

    QuerySnapshot snapshot = await moodCollection
    .document(uid)
    .collection('moodList')
    .getDocuments();

    List<Mood> _moodList = [];


    snapshot.documents.forEach((document) {
      _moodList.add(
        new Mood(
          type: document['mood'],
          time: document['time'].toDate(), 
          message: document['message'], 
          fav: document['fav'], 
          negative: document['negative'], 
          suicidal: document['suicide']
        ));

    });
    
    return sortListByDateTime(_moodList);
    

  }

  Future<List<Mood>> retriveMoodDataFB() async {

    QuerySnapshot snapshot = await moodCollection
    .document(uid)
    .collection('moodList')
    .getDocuments();

    List<Mood> _moodList = [];


    snapshot.documents.forEach((document) {
      _moodList.add(
        new Mood(
          type: document['mood'],
          time: document['time'].toDate(), 
          message: document['message'], 
          fav: document['fav'], 
          negative: document['negative'], 
          suicidal: document['suicide']
        ));

    });
    
    return sortListByDateTimeFB(_moodList);
    

  }

  //SORT ARRAY 

  List<Mood> sortListByDateTime(List<Mood> list) {
    list.sort(
      (b, a) => a.time.compareTo(b.time)
    );
    return list;
  }

  List<Mood> sortListByDateTimeFB(List<Mood> list) {
    list.sort(
      (a, b) => a.time.compareTo(b.time)
    );
    return list;
  }


}