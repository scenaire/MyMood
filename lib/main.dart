import 'package:flutter/material.dart';
import 'package:mymood/Services/Auth.dart';
import 'package:provider/provider.dart';

import 'Models/User.dart';
import 'Screens/Wrapper.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
        primaryColor: const Color.fromARGB(255,0, 150, 145),
        accentColor: const Color.fromARGB(255, 255, 96, 67),
        brightness: Brightness.light,

        textTheme: TextTheme(
          headline: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 24.0, color: const Color.fromARGB(255, 40, 40, 40)),
          body1: TextStyle(fontFamily: 'prompt', fontSize:16.0, color: Colors.grey[800]),
        )
      ),
      home: Wrapper()
      ),
    );
  }
}