import 'package:firebase_auth/firebase_auth.dart';
import 'package:mymood/Models/User.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser 

  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid);
    }
    else {
      return null;
    }
  }

  Stream< User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // sign in 

  Future signInwithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  // register

  Future registerUser(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      if (_userFromFirebaseUser(user) != null) {
        User(uid: user.uid).createUser('สาลี่', email, '000000000', 'pink');
      }
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}