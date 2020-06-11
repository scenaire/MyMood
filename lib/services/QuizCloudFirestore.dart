//AUTHOR : Jiratchaya Yeeto

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymood/Models/Quiz.dart';


class QuizCloudFirestore {

  final String uid;

  QuizCloudFirestore ({this.uid});

  final CollectionReference quizCollection = Firestore.instance.collection("User");

  //ADD 

  Future addQuiztoUser(Quiz quiz) async {

    try {
      await quizCollection
      .document(uid)
      .collection('quizList')
      .add({
        '2q_score' : quiz.get2Q,
        '9q_score' : quiz.get9Q,
        '8q_score' : quiz.get8Q,
        'time' : quiz.time,
      });

      return true;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  // GET

  Future<List<Quiz>> retriveQuizData() async {

    QuerySnapshot snapshot = await quizCollection
    .document(uid)
    .collection('quizList')
    .getDocuments();

    List<Quiz> _quizList = [];


    snapshot.documents.forEach((document) {
      _quizList.add(new Quiz(document['2q_score'],document['9q_score'],document['8q_score'],document['time'].toDate()));
    });

    return sortListByDateTime(_quizList);

  }

  //SORT ARRAY 

  List<Quiz> sortListByDateTime (List<Quiz> list) {
    list.sort(
      (a, b) => a.time.compareTo(b.time)
    );
    return list;
  }

}