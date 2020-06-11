//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/navpage/homepage/eachMoodDetail.dart';
import 'package:mymood/Services/MoodCloudFirestore.dart';
import 'package:mymood/Services/thCalendar.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SummaryYear extends StatelessWidget {

  final User user;

  SummaryYear({Key key, this.user}) : super(key: key);

  Future<List<Mood>> retriveData() async {
      MoodCloudFirestore mc = MoodCloudFirestore(uid: user.uid);
      return await mc.retriveMoodData();
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      child: SingleChildScrollView(

        child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 130,
                child: FutureBuilder(
                  future: retriveData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: JumpingText("กำลังโหลด...")
                      );
                    } else if (snapshot.data.length == 0) {
                      return Center(
                        child: Text("อย่าลืมเพิ่มอารมณ์ของคุณนะ"),
                      );
                    }
                    else {
                      return SingleChildScrollView(
                        child: AllCalendar(moodList: snapshot.data,)
                      );
                    }
                  },
                ),
              ),

      ),
      
    );
  }
}


class MoodIcon extends StatelessWidget {

  final Mood mood;

  const MoodIcon({
    Key key,
    this.mood
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String moodIcon;

    switch (mood.type) {
      case "Depress": moodIcon = "assets/pictures/cDepress2.png"; break;
      case "Unhappy":  moodIcon = "assets/pictures/cUnhappy2.png";  break;
      case "Normal":  moodIcon = "assets/pictures/cNormal2.png";  break;
      case "Happy":  moodIcon = "assets/pictures/cHappy2.png";  break;
      case "Maniac":  moodIcon = "assets/pictures/cManiac2.png"; break;
    }

    

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MoodDetail(mood: mood,)));
      },
      child: Image.asset(moodIcon)
    );
  }
}

class AllCalendar extends StatelessWidget {

  final List<Mood> moodList;

  const AllCalendar({
    Key key,
    this.moodList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Mood> monthList = new List<Mood>();
    DateTime current = new DateTime(moodList[0].time.year,moodList[0].time.month, moodList[0].time.day);
    List<Widget> mCalendar = new List<Widget>();
    List<Mood> temp = new List<Mood>();

    for (int i=0; i<moodList.length; i++) {
      
      if (current.month != moodList[i].time.month) {
        temp.addAll(monthList);
        monthList.clear();
        mCalendar.add(MonthCalendar(moodList: temp,));
        current = new DateTime(DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
        monthList.add(moodList[i]);
      } else {
        monthList.add(moodList[i]);
      }

      if (i == moodList.length-1) {
        mCalendar.add(MonthCalendar(moodList: monthList,));
      }
      
      
    }

    return Container(
      child: Column(
        children: mCalendar
      ),
    );
  }
}


class MonthCalendar extends StatelessWidget {


  final List<Mood> moodList;

  const MonthCalendar({
    Key key,
    this.moodList
  }) : super(key: key);

  Widget getMoodRow(List<Mood> mm) {

    List<Widget> list = new List<Widget>();

    for (int i=0; i<mm.length; i++) {
      list.add(new MoodIcon(mood: mm[i],));
    }
    
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );

  }

  Widget getMoodBalloon(List<Mood> lm) {

    List<Widget> list = new List<Widget>();
    List<Mood> temp = new List<Mood>();

    int lastRow = (lm.length / 6).floor();
    int index = 0;

    for (int i=0; i<=lastRow; i++) {
      if (lastRow == i) {
        for (int j=0; j<(lm.length%6); j++) {
          temp.add(lm[index]);
          index++;
        }
        list.add(getMoodRow(temp));
      }
      else if (lastRow != i) {
        for (int j=0; j<6; j++) {
          temp.add(lm[index]);
          index++;
        }
        list.add(getMoodRow(temp));
        temp.clear();
      }
    }

    // for (int i=0; i<lm.length; i++) {

    //   if (i%6 == 0) {
    //     count++;
    //   }

    //   if (count == lastRow) {
    //     if (i != lm.length-1) {
    //       temp.add(lm[i]);
    //     } else {
    //       temp.add(lm[i]);
    //       list.add(getMoodRow(temp));
    //       temp.clear();
    //     }
    //   } else {
    //       if (i==0) {
    //         temp.add(lm[i]);
    //       } else if (i%6 != 0) {
    //         temp.add(lm[i]);
    //       } else {
    //         list.add(getMoodRow(temp));
    //         temp.clear();
    //         temp.add(lm[i]);
    //       }
    //   }
      
    // }
    

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list
    );

  }

  @override
  Widget build(BuildContext context) {

    THCalendar cal = new THCalendar();


    String getYear() {
      return cal.yearFormatted(moodList[0].time);
    }

    String getMonth() {
      return cal.monthFormatted(moodList[0].time);
    }




    return Container(
      
      child: Column(

        children: <Widget>[

          Padding(padding: EdgeInsets.only(top: 30.0)),

          Text(getYear(), style: TextStyle(fontWeight: FontWeight.bold),),

          Text(getMonth()),

          Container(
            height: 10,
          ),

          Center(
            child: Container(

              width: MediaQuery.of(context).size.width,

              child: getMoodBalloon(new List.from(moodList.reversed)),

            )
          )

        ],

      ),


    );
  }
}