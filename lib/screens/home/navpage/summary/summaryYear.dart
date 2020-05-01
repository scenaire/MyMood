import 'package:flutter/material.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Services/MoodCloudFirestore.dart';
import 'package:mymood/Services/thCalendar.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SummaryYear extends StatelessWidget {

  final User user;

  SummaryYear({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Future<List<Mood>> retriveData() async {
    MoodCloudFirestore mc = MoodCloudFirestore(uid: user.uid);
    return await mc.retriveMoodData();
    }


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
                        child: MonthCalendar(moodList: snapshot.data,)
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
      case "Depress": moodIcon = "assets/pictures/cDepress.png"; break;
      case "Unhappy":  moodIcon = "assets/pictures/cUnhappy.png";  break;
      case "Normal":  moodIcon = "assets/pictures/cNormal.png";  break;
      case "Happy":  moodIcon = "assets/pictures/cHappy.png";  break;
      case "Maniac":  moodIcon = "assets/pictures/cManiac.png"; break;
    }

    return Image.asset(moodIcon);
  }
}


class MonthCalendar extends StatelessWidget {


  final List<Mood> moodList;

  const MonthCalendar({
    Key key,
    this.moodList
  }) : super(key: key);

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

          Text(getYear(), style: TextStyle(fontWeight: FontWeight.bold),),

          Text(getMonth()),

          Container(
            height: 10,
          ),

          Center(
            child: Container(

              width: MediaQuery.of(context).size.width,

              child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget> [

              Row(

                mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget> [

             MoodIcon(mood: Mood("Depress", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Happy", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Maniac", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Unhappy", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Normal", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Maniac", DateTime.now(), "", false),),


            ]
          ),

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [

             MoodIcon(mood: Mood("Depress", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Happy", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Maniac", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Unhappy", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Normal", DateTime.now(), "", false),),
             MoodIcon(mood: Mood("Maniac", DateTime.now(), "", false),),


            ]
          ),

            ]
          ),

            )
          )

        ],

      ),


    );
  }
}