import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: new Center(
          child: new Text("this is summery page"),
      ),
    );
  }
}