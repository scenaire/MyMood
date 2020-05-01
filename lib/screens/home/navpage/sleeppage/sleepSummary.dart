import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';

class SleepSummary extends StatefulWidget {

  final User user;

  SleepSummary({Key key, this.user}) : super(key: key);

  @override
  _SleepSummaryState createState() => _SleepSummaryState();
}

class _SleepSummaryState extends State<SleepSummary> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}