import 'package:cloud_firestore/cloud_firestore.dart';
import '../user.dart';

class userCloudFirestore {

  final databaseReference = Firestore.instance;

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

}