

import 'package:flutter/material.dart';

class RobotBubble extends StatelessWidget {

  final String msg;

  RobotBubble({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0),
      color: Colors.grey[100],
      child: Text(msg),
    );
  }
}