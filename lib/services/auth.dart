import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  // sign in 

  Future signInwithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password);
      user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
    }
  }

  // register

  Future registerUser(String email, String password) async {
    print(email);
    print(password);
    user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

  }


  // sign out

}