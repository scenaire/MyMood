import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/instructions/instructionsBeforeQuiz.dart';
import 'package:mymood/Screens/Home/quizpage/TwoQPage.dart';

class InstructionMain extends StatefulWidget {

  final User user;
  final bool fromRegister;

  InstructionMain ({Key key, this.user, this.fromRegister}) : super(key: key);
  

  @override
  _InstructionMainState createState() => _InstructionMainState();
}

class _InstructionMainState extends State<InstructionMain> {

  var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final pageOptions = [
      InsBeforeQuiz(user: widget.user,),
    ];


    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconThemeData,
        elevation: 0,
        title: Text(
          'คำแนะนำการใช้งาน',
          style: TextStyle(fontFamily: 'Anakotmai Medium', color: const Color.fromARGB(255, 40, 40, 40)),
        ),
        centerTitle: true,
      ),

      body: pageOptions[currentIndex],


    );
  }
}

