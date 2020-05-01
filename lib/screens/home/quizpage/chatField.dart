import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/quizpage/robotBubble.dart';

class ChatField extends StatefulWidget {

  final User user;

  ChatField({Key key, this.user}) : super(key: key);

  @override
  _ChatFieldState createState() => _ChatFieldState();
}

class _ChatFieldState extends State<ChatField> {

  List<String> messages;

  @override
  void initState() {
    super.initState();
    messages.add('สวัสดีจ้า');
    messages.add('เราจะมาคุยเรื่องแบบประเมินกันนะ');
  }


  @override
  Widget build(BuildContext context) {
    return Container(

  

      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return RobotBubble(msg: messages[index]);
        },

      )
      
    );
  }
}