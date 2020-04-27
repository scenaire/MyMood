import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mymood/Models/User.dart';


class UserCloudFirestore {

  final databaseReference = Firestore.instance;
  final CollectionReference userCollection = Firestore.instance.collection('User');

  //
  //
  //
  // User and Settings
  //
  //
  //

  void createUser(User user) async {
    await databaseReference.collection("User")
      .document(user.uid)
      .setData({
        'email' : user.email,
        'avatar' : user.avatar,
        'telephone' : user.telephone,
        'name' : user.name
      });
  }

  //
  //
  //
  // Everything with mood (Add, Delete, Fav)
  //
  //
  //

  // ADD




  //
  //
  //
  // Everything with questionaire (Add)
  //
  //
  //

  void addQuestionaireHistory(User user) async {
    await databaseReference.collection("User")
      .document(user.uid)
      .collection('questionHistory')
      .add({
        'time' : 0,
        '2Q_Score' : 0,
        '9Q_Score' : 0,
        '8Q_Score' : 0,
        'MDQ_Score' : 0
      });
  }


}