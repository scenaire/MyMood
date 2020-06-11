//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Authenticate/Firstpage.dart';
import 'package:provider/provider.dart';

import 'Home/MyHomePage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    if (user == null) {
      return FirstPage();
    } else {
      return MyHomePage(user: user,);
    }
  }
}