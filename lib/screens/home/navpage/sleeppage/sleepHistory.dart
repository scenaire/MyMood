import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mymood/Models/Sleep.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Services/SleepCloudFireStore.dart';
import 'package:mymood/Services/thCalendar.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SleepHistory extends StatefulWidget {

  final User user;

  SleepHistory({Key key, this.user}) : super(key: key);

  @override
  _SleepHistoryState createState() => _SleepHistoryState();
}

class _SleepHistoryState extends State<SleepHistory> {

  Future<List<Sleep>> retriveData() async {
    SleepCloudFireStore sc = SleepCloudFireStore(uid: widget.user.uid);
    return await sc.retriveSleepData();
  }

  Widget addSeperateByDate(List<Sleep> sList) {
    THCalendar thCalendar = new THCalendar();
    List<Widget> list = new List<Widget>();

    DateTime currentTime = sList[0].getSleepTime;
    int end = sList.length;

    list.add(new DateCard(date: thCalendar.changetoThaiDate(currentTime)));

    for (var i=0; i < end; i++) {
      String dif = DateFormat('yyyy-MM-dd').format(sList[i].getSleepTime);
      String com = DateFormat('yyyy-MM-dd').format(currentTime);
      if (dif == com) {
          list.add(
            new SleepCard(sleep: sList[i],)
          );
      } else {
          currentTime = sList[i].createDate;
          list.add(
            new DateCard(date: thCalendar.changetoThaiDate(currentTime))
          );
          list.add(
            new SleepCard(sleep: sList[i],)
          );
        }
        
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list
    );

  }

  
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Color(0xFFFFFFFF),
      child: new SingleChildScrollView(
        child: Column (
          
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: retriveData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(height: MediaQuery.of(context).size.height - 220, child: Center(child: JumpingText('กำลังโหลด...'),), );
                  } else if (snapshot.data.length == 0) {
                    return Container(height: MediaQuery.of(context).size.height - 220, child: Center(child: Text('คุณยังไม่ได้ทำการเพิ่มการนอน'),), );
                  } else {
                    return addSeperateByDate(snapshot.data);
                  }
                },
              ),
            )

          ],
        )
      ),
      
    );
  }
}

class SleepCard extends StatelessWidget {

  final Sleep sleep;

  const SleepCard ({Key key, this.sleep}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    THCalendar cal = new THCalendar();

    return Container(
      margin: EdgeInsets.all(8.0),
      height: 150,
      child: Card (
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        elevation: 0,
        color: Colors.white,
        child: Container(
          child: Column(
            children: <Widget> [

             Row(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Container(
                margin: EdgeInsets.only(top: 20, right: 20, left:20),
                child: Column(
                children: <Widget> [
                  Image.asset('assets/pictures/full-moon.png', height: 40,),
                  Container(height: 5,),
                  Text(cal.timeFormatted(sleep.getSleepTime)),
                ]
              ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20, right: 20, left:20),
                child: Column(
                children: <Widget> [
                  Image.asset('assets/pictures/sunny.png', height: 40,),
                  Container(height: 5,),
                  Text(cal.timeFormatted(sleep.getWakeUp)),
                ]
              ),
              ),


            ],
          ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Text('รวมชั่วโมง : ', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(sleep.getCalculateSleepTime.toString()),
                ]
            ),
            )

            ]
          ),
        ),
      ),
      
    );
  }
}

class DateCard extends StatelessWidget {

  final String date;

  const DateCard ({
    Key key,
    this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 20), 
      child: Center(
        child: Text("--- " + date + " ---",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
      )
    );
  }
}