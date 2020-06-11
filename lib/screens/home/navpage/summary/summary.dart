//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/navpage/summary/summaryGraphs.dart';
import 'package:mymood/Screens/Home/navpage/summary/summaryYear.dart';

class SummaryPage extends StatefulWidget {


  final User user;

  SummaryPage({Key key, this.user}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {

  bool pressedYear = true;
  bool pressedGraphs = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Color clickedBG = Colors.white;
    Color clickedText = Theme.of(context).primaryColor;
    Color subBG = Colors.grey[100];
    Color subText = Colors.black;

    final pageOptions = [
      SummaryYear(user: widget.user,),
      SummaryGraphs(user: widget.user),
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
                          pressedYear = true;
                          pressedGraphs = false;
                          currentIndex = 0;
                        });
                      },
                      color: pressedYear? clickedBG : subBG,
                      child: Text(
                        "ตัวบอล",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 18, color: pressedYear? clickedText : subText, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          pressedGraphs = true;
                          pressedYear = false;
                          currentIndex = 1;
                        });
                      },
                      color: pressedGraphs? clickedBG : subBG,
                      child: Text(
                        "กราฟ",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 18, color: pressedGraphs? clickedText: subText, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                
                ]
              ),

              Container(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: pageOptions[currentIndex],
                )
              ),
            ]
          ),
          //child: SummaryYear(user: widget.user),
      ),
    );
  }
}