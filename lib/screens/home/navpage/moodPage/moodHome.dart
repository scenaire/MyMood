import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymood/screens/home/home.dart';
import 'package:mymood/screens/home/navpage/moodPage/moodAddons.dart';
import 'package:mymood/services/thCalendar.dart';

class MoodHome extends StatefulWidget {
  @override
  _MoodHomeState createState() => _MoodHomeState();
}

class _MoodHomeState extends State<MoodHome> {
  var date = DateTime.now();
  final THCalendar _thCalendar = THCalendar();

  var sliderValue = 2.5;
  var moodColor = Colors.grey;
  String moodString = "เฉยๆ";

  List<String> moodStringList = [
    "เศร้า",
    "รู้สึกแย่",
    "เฉยๆ",
    "รู้สึกดี",
    "มีความสุขมาก"
  ];

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
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'สวัสดีสาลี่',
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                'วันนี้คุณรู้สึกอย่างไร',
                style: Theme.of(context).textTheme.headline,
              ),
              FlatButton(
                color: Colors.transparent,
                onPressed: () {
                  openDatePicker();
                },
                child: Text(
                  _thCalendar.getDateTimeFormatted(date),
                  style: TextStyle(
                      fontFamily: 'prompt',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[400]),
                ),
                padding: EdgeInsets.all(20),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).copyWith().size.height / 3,
                      color: moodColor,
                    ),
                    Center(
                      child: Text(
                        moodString,
                        style: TextStyle(fontSize: 20, color: moodColor),
                      ),
                    ),
                    Container(
                      child: Slider(
                        min: 0.0,
                        max: 5.0,
                        divisions: 150,
                        value: sliderValue,
                        activeColor: moodColor,
                        inactiveColor: Colors.blueGrey[100],
                        onChanged: (newValue) {
                          setState(() {
                            sliderValue = newValue;
                            if (sliderValue > 0.0 && sliderValue <= 1.0) {
                              moodColor = Colors.red;
                              moodString = moodStringList[0];
                            } else if (sliderValue > 1.0 &&
                                sliderValue <= 2.0) {
                              moodColor = Colors.indigo;
                              moodString = moodStringList[1];
                            } else if (sliderValue > 2.0 &&
                                sliderValue <= 3.0) {
                              moodColor = Colors.blueGrey;
                              moodString = moodStringList[2];
                            } else if (sliderValue > 3.0 &&
                                sliderValue <= 4.0) {
                              moodColor = Colors.amber;
                              moodString = moodStringList[3];
                            } else if (sliderValue > 4.0 &&
                                sliderValue <= 5.0) {
                              moodColor = Colors.pink;
                              moodString = moodStringList[4];
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Center(
                      child: Container(
                          child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(20),
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: Text(
                            'บันทึก',
                            style: TextStyle(
                                fontFamily: 'prompt',
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          onPressed: () {
                            Navigator.pop(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                          },
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(20),
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          child: Text(
                            'ถัดไป',
                            style: TextStyle(
                                fontFamily: 'prompt',
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MoodAddons()));
                          },
                        ),
                      )),
                    ],
                  ))))
            ],
          )),
        ));
  }

  void openDatePicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return new Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.transparent,
            child: CupertinoDatePicker(
              initialDateTime: date,
              onDateTimeChanged: (DateTime newdate) {
                setState(() {
                  date = newdate;
                });
              },
              use24hFormat: true,
              minimumDate: DateTime(date.year, date.month, date.day - 7),
              maximumDate: date,
              mode: CupertinoDatePickerMode.dateAndTime,
            ),
          );
        });
  }
}
