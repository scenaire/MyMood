import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymood/Models/Sleep.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/MyHomePage.dart';
import 'package:mymood/Services/SleepCloudFireStore.dart';
import 'package:mymood/Services/thCalendar.dart';

class AddSleepPage extends StatefulWidget {

  final User user;

  AddSleepPage({Key key, this.user}) : super(key: key);

  @override
  _AddSleepPageState createState() => _AddSleepPageState();
}

class _AddSleepPageState extends State<AddSleepPage> {

  var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));

  var startSleep = DateTime.now();
  var endSleep = DateTime.now();
  var minimumDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2);
  var maximumDate = DateTime.now();
  final THCalendar _thCalendar = THCalendar();
  bool showConcern = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: iconThemeData,
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('เพิ่มการนอน', style: TextStyle(fontFamily: 'Anakotmai Medium', color: Colors.black)),
        ),

        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

              // เวลานอน

              Container(

                width: MediaQuery.of(context).size.width - 30,

                margin: EdgeInsets.only(bottom: 30),

                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0)
                  )
                ),

                child: Column(
                  children: <Widget> [


                    Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset("assets/pictures/full-moon.png", height: 100,),
              ),

              Text(
                'เวลานอนของคุณ',
                style: TextStyle(
                      fontFamily: 'Anakotmai Medium',
                      fontSize: 20,
                      color: Colors.black),
              ),

              FlatButton(
                color: Colors.transparent,
                onPressed: () {
                  openDatePickerStart();
                },
                child: Text(
                  _thCalendar.getDateTimeFormatted(startSleep),
                  style: TextStyle(
                      fontFamily: 'prompt',
                      fontSize: 18,
                      color: Colors.grey[500]),
                ),
                padding: EdgeInsets.all(20),
              ),


                  ]
                ),

              ),

              //เวลาตื่น

              Container(

                width: MediaQuery.of(context).size.width - 30,

                margin: EdgeInsets.only(bottom: 20),

                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0)
                  )
                ),

                child: Column(

                  children: <Widget>[

                    Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset("assets/pictures/sunny.png", height: 100,),
              ),

              Text(
                'เวลาตื่นของคุณ',
                style: TextStyle(
                      fontFamily: 'Anakotmai Medium',
                      fontSize: 20,
                      color: Colors.black)
              ),

              FlatButton(
                color: Colors.transparent,
                onPressed: () {
                  openDatePickerEnd();
                },
                child: Text(
                  _thCalendar.getDateTimeFormatted(endSleep),
                  style: TextStyle(
                      fontFamily: 'prompt',
                      fontSize: 18,
                      color: Colors.grey[500]),
                ),
                padding: EdgeInsets.all(20),
              ),

                  ],

                ),

              ),

              //Concern Text

              Visibility(
                visible: showConcern,
                child: Text('กรุณากรอกข้อมูลให้ถูกต้อง', style: TextStyle(color: Colors.red),),
              ),

              
              //ปุ่มบันทึก


              Container(
                margin: EdgeInsets.only(top: 10),
                child: RaisedButton(
                onPressed: () async {
                  if (endSleep.isAfter(startSleep) && endSleep.isBefore(DateTime.now()) && startSleep.isBefore(DateTime.now())) {
                    SleepCloudFireStore sc = SleepCloudFireStore(uid: widget.user.uid);
                    Sleep sleep = new Sleep(createDate: DateTime.now(), wakeUp: endSleep, sleep: startSleep);
                    sleep.setCalculateSleepTime(sleep.calculateSleepTimeMethod());

                    dynamic result = await sc.addSleeptoUser(sleep);

                    if (result != null) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(user: widget.user, currentPage: 2,)));
                    }
                  } else {
                    setState(() {
                      showConcern = true;
                    });
                  }
                },
                textColor: Theme.of(context).primaryColor,
                //borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 3.0, style: BorderStyle.solid),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("บันทึก", style: TextStyle(
                                    fontFamily: 'Prompt',
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600),),
              ),
              ),



              ],
            )
          ),
        ),
    );
  }

  void openDatePickerStart() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return new Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.transparent,
            child: CupertinoDatePicker(
              initialDateTime: maximumDate,
              onDateTimeChanged: (DateTime newdate) {
                setState(() {
                  startSleep = newdate;
                });
              },
              use24hFormat: true,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              mode: CupertinoDatePickerMode.dateAndTime,
            ),
          );
        });
  }

  void openDatePickerEnd() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return new Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.transparent,
            child: CupertinoDatePicker(
              initialDateTime: maximumDate,
              onDateTimeChanged: (DateTime newdate) {
                setState(() {
                  endSleep = newdate;
                });
              },
              use24hFormat: true,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              mode: CupertinoDatePickerMode.dateAndTime,
            ),
          );
        });
  }

}