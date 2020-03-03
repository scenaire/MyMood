import 'package:flutter/material.dart';
import 'package:mymood/models/user.dart';
import 'package:mymood/screens/authenticate/authenticate.dart';
import 'package:mymood/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}