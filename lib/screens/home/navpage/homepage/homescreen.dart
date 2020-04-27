import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/navpage/homepage/eachMoodDetail.dart';
import 'package:mymood/Services/MoodCloudFirestore.dart';
import 'package:mymood/Services/thCalendar.dart';
import 'package:progress_indicators/progress_indicators.dart';

class HomeScreen extends StatefulWidget {

  final User user;

  HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  Widget addSeperateByDate (List<Mood> mList) {
    THCalendar thCalendar = new THCalendar();
    List<Widget> list = new List<Widget>();

    DateTime currentTime = mList[0].time;
    int end = mList.length;

    list.add(new DateCard(date: thCalendar.changetoThaiDate(currentTime)));

    for (var i=0; i < end; i++) {
      String dif = DateFormat('yyyy-MM-dd').format(mList[i].time);
      String com = DateFormat('yyyy-MM-dd').format(currentTime);
      if (dif == com) {
          list.add(
            new MoodCard(mood: mList[i],)
          );
      } else {
          currentTime = mList[i].time;
          list.add(
            new DateCard(date: thCalendar.changetoThaiDate(currentTime))
          );
          list.add(
            new MoodCard(mood: mList[i],)
          );
        }
        
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list
    );

  }

  Widget getMoodCardWidget (List<Mood> mList) {
    List<Widget> list = new List<Widget>();

    int end = mList.length;

    
    for(var i = 0; i < end; i++) {

      list.add(
        new MoodCard(
          mood: mList[i]
        )
      );
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list
    );
  }

  Future<List<Mood>> retriveData() async {
    MoodCloudFirestore mc = MoodCloudFirestore(uid: widget.user.uid);
    return await mc.retriveMoodData();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xFFFEFEFE),
      child:  new SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container(
              //       width: MediaQuery.of(context).size.width,
              //       height: 70,
              //       child: Center(
              //         child: Text("เว้นที่ไว้ใส่ฟิลเตอร์")
              //       ),
                    
              //       decoration: new BoxDecoration(
              //         color: Colors.amber,
                      
              //       ),
              // ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 130,
                child: FutureBuilder(
                  future: retriveData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: JumpingText("Loading...")
                      );
                    } else if (snapshot.data.length == 0) {
                      return Center(
                        child: Text("อย่าลืมเพิ่มอารมณ์ของคุณนะ"),
                      );
                    }
                    else {
                      return SingleChildScrollView(
                        child: addSeperateByDate(snapshot.data)
                      );
                    }
                  },
                ),
              )

              


            ]
          )
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


class MoodCard extends StatelessWidget {

  final Mood mood;

  const MoodCard({
    Key key,
    this.mood
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    String icon;
    Color moodColor;
    THCalendar thCal = new THCalendar();
    String title;

    String time = thCal.timeFormatted(mood.time);

    switch (mood.type) {
      case "Depress": icon = "assets/pictures/depress.png"; moodColor = Colors.deepPurple[200]; title = "เศร้ามาก" ; break;
      case "Unhappy": icon = "assets/pictures/sad.png"; moodColor = Colors.blue[200]; title = "รู้สึกแย่"; break;
      case "Normal": icon = "assets/pictures/normal.png"; moodColor = Colors.blueGrey[100]; title = "ปกติ"; break;
      case "Happy": icon = "assets/pictures/happy.png"; moodColor = Colors.amber[400]; title = "รู้สึกดี"; break;
      case "Maniac": icon = "assets/pictures/mania.png"; moodColor = Colors.pink[100]; title = "มีความสุขมาก"; break;
    }


    return new GestureDetector(
      child: new Container(
      child: Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  width: 3,
                  color: moodColor,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 24,
                    color: Color(0xFFB7B7B7).withOpacity(.16)
                  ),
                ],
              ),
            ),

            Image.asset(
              icon,
              height: 150,
              width: 150,
            ),

            Positioned(
              left: 150,
              child: Container (
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 18, color: moodColor, fontWeight: FontWeight.w600),
                    ),

                    Text(
                      time,
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey[800], fontWeight: FontWeight.w600),
                    ),

                    Expanded(
                      child: Text(
                        mood.message,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              )
            )



          ]
        )
      ),
    ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MoodDetail(mood: mood,)));
      },
    );
  }

}