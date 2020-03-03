import 'package:flutter/material.dart';
import 'package:mymood/screens/wrapper.dart';
import 'package:mymood/services/auth.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
        primaryColor: const Color.fromARGB(255,0, 68, 69),
        accentColor: const Color.fromARGB(255, 248, 180, 0),
        brightness: Brightness.light,

        textTheme: TextTheme(
          headline: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 24.0, color: const Color.fromARGB(255,0, 68, 69)),
          body1: TextStyle(fontFamily: 'prompt', fontSize:16.0, color: Colors.grey[800]),
        )
      ),
      home: Wrapper()
      ),
    );
  }
}

