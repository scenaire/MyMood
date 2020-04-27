import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Services/MoodCloudFirestore.dart';

import '../../MyHomePage.dart';

class MoodAddons extends StatefulWidget {
  final String moodToSend;
  final DateTime date;
  final User user;

  MoodAddons({Key key, this.user, this.moodToSend, this.date}) : super (key: key);

  @override
  _MoodAddonsState createState() => _MoodAddonsState();
}

class _MoodAddonsState extends State<MoodAddons> {
  
  
  final messageController = TextEditingController();
  

  Mood mood;
  String msg;
  bool fav = false;


  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var iconThemeData = IconThemeData(color: Theme.of(context).primaryColor);
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: iconThemeData,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Center(
            child: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20
              ),
              child: Text(
                'คุณรู้สึกอะไรอยู่',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Container(
              
              width: MediaQuery.of(context).copyWith().size.width/1.1,
              child: TextField(
                controller: messageController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "เกิดอะไรขึ้นบ้าง ลองเล่าให้เราฟังหน่อยสิ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      style: BorderStyle.solid
                    )
                  ),
                )
              )
            ),
            Container(
              padding: EdgeInsets.only(top:20.0),
              child: RaisedButton(
                child: Text('บันทึก', style: TextStyle(fontFamily: 'prompt', fontSize: 24.0, color: Colors.white)),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                onPressed: () async { 
                  MoodCloudFirestore mc = MoodCloudFirestore(uid: widget.user.uid);
                  msg = messageController.text;
                  mood = new Mood(widget.moodToSend,widget.date,msg,fav);
                  dynamic result = await mc.addMoodtoUser(mood);
                  if (result != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(user: widget.user)));
                  }
            }))
          ],
        ),
            )
        ),
      ),
    );
  }
}