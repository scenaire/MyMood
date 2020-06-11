//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/navpage/sleeppage/addSleep.dart';
import 'package:mymood/Screens/Home/navpage/sleeppage/sleepHistory.dart';
import 'package:mymood/Screens/Home/navpage/sleeppage/sleepSummary.dart';

class SleepPage extends StatefulWidget {

  final User user;

  SleepPage({Key key, this.user}) : super(key: key);

  
  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {

  bool pressedSummary = true;
  bool pressedHistory = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Color clickedBG = Colors.white;
    Color clickedText = Theme.of(context).primaryColor;
    Color subBG = Colors.grey[100];
    Color subText = Colors.black;

    final pageOptions = [
      SleepSummary(user: widget.user,),
      SleepHistory(user: widget.user),
    ];

    
    return Container(
      color: Colors.white,
      child: new Center(
          child: Column(
            children: <Widget> [
              Row(
                children: <Widget> [
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          pressedSummary = true;
                          pressedHistory = false;
                          currentIndex = 0;
                        });
                      },
                      color: pressedSummary? clickedBG : subBG,
                      child: Text(
                        "ผลสรุป",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 20, color: pressedSummary? clickedText : subText, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          pressedHistory = true;
                          pressedSummary = false;
                          currentIndex = 1;
                        });
                      },
                      color: pressedHistory? clickedBG : subBG,
                      child: Text(
                        "ประวัติ",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 20, color: pressedHistory? clickedText: subText, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                
                ]
              ),

              Container(
                height: MediaQuery.of(context).size.height - 278,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFF2F2F2),
                child: SingleChildScrollView(
                  child: pageOptions[currentIndex],
                ),
              ),

             

              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                color: Colors.white,
                child: Center(
                  child: ButtonTheme(
                    minWidth: 100,
                    height: 50,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                      elevation: 0.0,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddSleepPage(user: widget.user)));},
                      child: Text(
                        "เพิ่มการนอน",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ),
              ),


            ]
          ),
      ),
    );
  }
}

