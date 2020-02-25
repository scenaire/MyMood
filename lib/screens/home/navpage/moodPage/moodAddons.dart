import 'package:flutter/material.dart';
import 'package:mymood/screens/home/home.dart';

class MoodAddons extends StatefulWidget {
  @override
  _MoodAddonsState createState() => _MoodAddonsState();
}

class _MoodAddonsState extends State<MoodAddons> {
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
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'คุณทำอะไรบ้าง',
              style: Theme.of(context).textTheme.headline,
            ),
            Container(
              height: MediaQuery.of(context).copyWith().size.height / 4,
              width: MediaQuery.of(context).copyWith().size.width,
              color: Colors.amber[200],
              child: Text('สำหรับใส่ Widget เลือกอิโมติคอน'),
            ),
            Container(
              height: MediaQuery.of(context).copyWith().size.height / 3 + 30.0,
              width: MediaQuery.of(context).copyWith().size.width,
              color: Colors.lightGreen[200],
              child: Text('สำหรับใส่ Widget Text'),
            ),
            Container(
              padding: EdgeInsets.only(top:20.0),
              child: RaisedButton(
                child: Text('บันทึก', style: TextStyle(fontFamily: 'prompt', fontSize: 24.0, color: Colors.white)),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
            }))
          ],
        )),
      ),
    );
  }
}
