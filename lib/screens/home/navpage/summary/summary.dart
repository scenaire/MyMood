import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/navpage/summary/summaryYear.dart';

class SummaryPage extends StatefulWidget {


  final User user;

  SummaryPage({Key key, this.user}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: new Center(
          child: SummaryYear(user: widget.user),
      ),
    );
  }
}