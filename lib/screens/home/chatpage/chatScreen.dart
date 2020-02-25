import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    var iconThemeData = IconThemeData(color: Colors.white);

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,

        /************************AppBar */

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: iconThemeData,
          elevation: 0,
          title: Text(
            'คุยกับเรา',
            style: TextStyle(fontFamily: 'Anakotmai Medium'),
          ),
          centerTitle: true,
        ),

        /**************************Body */

        body: Column(children: <Widget>[
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                ),
          )
        ]));
  }
}
