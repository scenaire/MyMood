import 'package:flutter/material.dart';

class SleepPage extends StatefulWidget {
  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0)
          ),
        ),
        //TODO : แก้ตรงนี้ใส่ตามหน้า
        child: new Center(
          child: new Text("this is sleeping page"),
        ),
      ),
    );
  }
}