import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymood/Models/Mood.dart';

class MoodCloudFirestore {

  final String uid;

  MoodCloudFirestore ({this.uid});

  final CollectionReference moodCollection = Firestore.instance.collection("User");


  // ADD 

    Future addMoodtoUser(Mood mood) async {
    String moodInput = "";
    // switch (mood.type) {
    //   case MoodEnums.Maniac : moodInput = "Maniac"; break;
    //   case MoodEnums.Happy : moodInput = "Happy"; break;
    //   case MoodEnums.Unhappy : moodInput = "Unhappy"; break;
    //   case MoodEnums.Depress : moodInput = "Depress"; break;
    //   default : moodInput = "Nornal";
    // }
    try {
      await moodCollection
      .document(uid)
      .collection('moodList')
      .add({
        'mood' : mood.type,
        'time' : mood.time,
        'fav' : mood.fav,
        'message' : mood.message,
      });
      
      return true;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  //GET

  Future<List<Mood>> retriveMoodData() async {

    MoodEnums _moodtype;

    QuerySnapshot snapshot = await moodCollection
    .document(uid)
    .collection('moodList')
    .getDocuments();

    List<Mood> _moodList = [];


    snapshot.documents.forEach((document) {
      _moodList.add(new Mood(document['mood'], document['time'].toDate(), document['message'], document['fav']));
    });

    return sortListByDateTime(_moodList);

  }

  //SORT ARRAY 

  List<Mood> sortListByDateTime (List<Mood> list) {
    list.sort(
      (b, a) => a.time.compareTo(b.time)
    );
    return list;
  }


}