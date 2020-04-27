import 'package:flutter/material.dart';

class SleepPage extends StatefulWidget {
  @override
  _SleepPageState createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
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
                      onPressed: () => {},
                      color: Colors.white,
                      child: Text(
                        "ผลสรุป",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 20, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () => {},
                      color: Colors.blueGrey[100],
                      child: Text(
                        "ประวัติ",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                
                ]
              ),

              Container(
                height: MediaQuery.of(context).size.height - 270,
                width: MediaQuery.of(context).size.width,
                color: Colors.green
              ),

              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: ButtonTheme(
                    minWidth: 100,
                    height: 50,
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () => {},
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