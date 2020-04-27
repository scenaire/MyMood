

import 'package:mymood/Services/UserCloudFirestore.dart';

class User {

  String uid;
  String email;
  String name;
  String telephone;
  String avatar;

  UserCloudFirestore uc = UserCloudFirestore();
  
  User({
    this.uid
  });

  void createUser (String _name, String _email, String _telephone, String _avatar) {
    name = _name;
    email = _email;
    telephone = _telephone;
    avatar = _avatar;
    uc.createUser(this);
  }

 


}