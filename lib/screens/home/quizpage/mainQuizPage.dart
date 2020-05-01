import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/quizpage/chatField.dart';

class QuizPage extends StatefulWidget {

  final User user;

  QuizPage({Key key, this.user}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      //*********************Appbar */
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconThemeData,
        elevation: 0,
        title: Text(
          'ทำแบบประเมิน',
          style: TextStyle(fontFamily: 'Anakotmai Medium', color: const Color.fromARGB(255, 40, 40, 40)),
        ),
        centerTitle: true,
      ),

      body: Column(

        children: <Widget>[

          ChatField(user: widget.user,)

        ],




      )

    );
  }
}