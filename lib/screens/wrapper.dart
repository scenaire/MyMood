import 'package:flutter/material.dart';
import 'package:mymood/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate Widget
    return Authenticate();
  }
}