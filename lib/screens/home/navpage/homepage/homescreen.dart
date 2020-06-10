import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/navpage/homepage/eachMoodDetail.dart';
import 'package:mymood/Screens/Home/navpage/others/hotline.dart';
import 'package:mymood/Screens/Home/navpage/others/searchClinic.dart';
import 'package:mymood/Screens/Home/quizpage/MDQPage.dart';
import 'package:mymood/Screens/Home/quizpage/TwoQPage.dart';
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

  Future<List<Mood>> moodData;
  bool showTriggerSuicide = false; 
  bool showTriggerNegative = false;

  @override
  void initState() {
    super.initState();
    moodData = retriveData();
  }

  Widget notificationDepressGraphs() {
    return Container(
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFCAE7E7),
              border: Border.all(width: 3, color: Color(0xFFCAE7E7),),
              borderRadius: BorderRadius.all(Radius.circular(16.0))
            ),
            child: Column(
              children: <Widget> [
                Text('เราอยากช่วยเหลือคุณ', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                Container(
                  margin: EdgeInsets.all(8.0), 
                  child: Image.asset('assets/pictures/nursing.png'),
                ),
                Text('เราตรวจพบว่าคุณมีความเสี่ยงของโรคซึมเศร้า', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('จากการกรอกข้อมูลอารมณ์ของคุณ', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('เราขอแนะนำให้คุณทำแบบประเมินความเสี่ยง', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                ButtonTheme(
                  minWidth: 150,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TwoQPage())); }, 
                    child: Text('ทำแบบประเมินโรคซึมเศร้า', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.white), textAlign: TextAlign.center,),),
                )
              ]
            )
          );
  }

  Widget notificationBipolarGraphs() {
    return Container(
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFCAE7E7),
              border: Border.all(width: 3, color: Color(0xFFCAE7E7),),
              borderRadius: BorderRadius.all(Radius.circular(16.0))
            ),
            child: Column(
              children: <Widget> [
                Text('เราอยากช่วยเหลือคุณ', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                Container(
                  margin: EdgeInsets.all(8.0), 
                  child: Image.asset('assets/pictures/nursing.png'),
                ),
                Text('เราตรวจพบว่าคุณมีความเสี่ยงของโรคอารมณ์สองขั้ว', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('จากการกรอกข้อมูลอารมณ์ของคุณ', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('เราขอแนะนำให้คุณทำแบบประเมินความเสี่ยง', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                ButtonTheme(
                  minWidth: 150,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MDQPage())); }, 
                    child: Text('ทำแบบประเมิน MDQ', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.white), textAlign: TextAlign.center,),),
                )
              ]
            )
          );
  }

  Widget notificationDepress() {

    return Container(
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
            decoration: BoxDecoration(
              color: Color(0xFFCAE7E7),
              border: Border.all(width: 3, color: Color(0xFFCAE7E7),),
              borderRadius: BorderRadius.all(Radius.circular(16.0))
            ),
            child: Column(
              children: <Widget> [
                Text('เราอยากช่วยเหลือคุณ', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                Container(
                  margin: EdgeInsets.all(8.0), 
                  child: Image.asset('assets/pictures/nursing.png'),
                ),
                Text('เราตรวจพบว่าคุณมีความเสี่ยงของโรคซึมเศร้า', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('จากข้อความที่คุณบันทึกเข้ามาล่าสุด', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('เราขอแนะนำให้คุณทำแบบคัดกรองเพื่อประเมินความเสี่ยง', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                ButtonTheme(
                  minWidth: 150,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => TwoQPage())); }, 
                    child: Text('ทำแบบประเมิน', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.white), textAlign: TextAlign.center,),),
                )
              ]
            )
          );
  }

  Widget notificationSuicidal() {

    return Container(
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFCAE7E7),
              // border: Border.all(width: 3, color: const Color.fromARGB(255, 251, 215, 219)),
               borderRadius: BorderRadius.all(Radius.circular(16.0))
            ),
            child: Column(
              children: <Widget> [
                Text('เราอยากช่วยเหลือคุณ', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                Container(
                  margin: EdgeInsets.all(8.0), 
                  child: Image.asset('assets/pictures/nursing.png'),
                ),
                Text('เราตรวจพบว่าคุณมีความเสี่ยงในการทำร้ายตนเอง', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('จากข้อความที่คุณบันทึกเข้ามาล่าสุด', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('เราขอแนะนำให้คุณพบจิตแพทย์ที่ใกล้ที่สุด', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('หรือโทรปรึกษาฮอตไลน์สุขภาพจิตอย่างเร่งด่วน', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(bottom: 8.0)),
                ButtonTheme(
                  minWidth: 150,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => HotlinePage())); }, 
                    child: Text('Hotline', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.white), textAlign: TextAlign.center,),),
                ),
                ButtonTheme(
                  minWidth: 150,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SearchClinic())); }, 
                    child: Text('ค้นหาคลินิกจิตเวช', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.white), textAlign: TextAlign.center,),),
                )
              ]
            )
          );
  }

  bool checkDepress(List<Mood> mList) {

    bool isDepression = true;
    DateTime current = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime end = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 13);

    if (mList.length < 14) {
      return false;
    }

    for (int i=0; i<mList.length; i++) {

      if (current.isAfter(end)) {

        if (mList[i].getType != 'Depress' && mList[i].getType != 'Unhappy') {
          isDepression = false;
          return isDepression;
        } else {
          current = new DateTime(current.year, current.month, current.day - 1);
        }
      } else {
        return isDepression;
      }
    }

    return isDepression;

  }

  bool checkBipolar(List<Mood> mList) {
    bool isMania = true;
    DateTime current = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    if (mList.length < 20) {
      return false;
    }

    // Mania phase -- Start
    if (mList[0].getType == 'Happy' || mList[0].getType == 'Maniac') {

      DateTime end = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 7);
      int j = 0;
      bool depressState = false;

      for (int i=0; i<mList.length; i++) {
        if (current.isAfter(end)) {
          if (mList[i].getType != 'Happy' && mList[i].getType != 'Maniac') {
            isMania = false;
            return isMania;
          } else {
            current = new DateTime(current.year, current.month, current.day - 1);
          }
        } else {
          if (mList[i].getType == 'Happy' || mList[i].getType == 'Maniac') {
            if (!depressState) {
              current = new DateTime(current.year, current.month, current.day - 1);
            }
          } else if (mList[i].getType == 'Unhappy' || mList[i].getType == 'Depress') {

            depressState = true;

            
              if (j < 20) {
                if (mList[i].getType != 'Depress' && mList[i].getType != 'Unhappy') {
                return false;
              } else {
                current = new DateTime(current.year, current.month, current.day - 1);
              }
              }
            
          } else {
            return false;
          }

        }
      }
      
    } else if (mList[0].getType == 'Unhappy' || mList[0].getType == 'Depress') {

    }

    return isMania;
  }

  Widget addSeperateByDate(List<Mood> mList) {
    THCalendar thCalendar = new THCalendar();
    List<Widget> list = new List<Widget>();

    DateTime currentTime = mList[0].time;
    int end = mList.length;

    if (checkBipolar(mList)) {
      list.add(notificationBipolarGraphs());
    } else if (checkDepress(mList)) {
      list.add(notificationDepressGraphs());
    }

    if(mList[0].suicidal.trim() != '') {
      list.add(notificationSuicidal());
    } else if (mList[0].negative.trim() != '') {
      list.add(notificationDepress());
    }

    

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

  Future<List<Mood>> retriveData() async {
    MoodCloudFirestore mc = MoodCloudFirestore(uid: widget.user.uid);
    return await mc.retriveMoodData();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xFFF8F8F8),
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
                  future: moodData,
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

    //Colors.deepPurple[200]
    //Colors.blue[200]
    //Colors.blueGrey[100]
    //Colors.amber[400]
    //Colors.pink[100]

    const Color depressColor = Color(0xFFbe9abf);
    const Color unHappyColor = Color(0xFF85A2A6);
    const Color normalColor = Color(0xFFced994);
    const Color happyColor = Color(0xFFf5d791);
    const Color maniacColor = Color(0xFFF2695C);

    String icon;
    Color moodColor;
    THCalendar thCal = new THCalendar();
    String title;

    String time = thCal.timeFormatted(mood.time);

    switch (mood.type) {
      case "Depress": icon = "assets/pictures/cDepress2.png"; moodColor = depressColor; title = "เศร้ามาก" ; break;
      case "Unhappy": icon = "assets/pictures/cUnhappy2.png"; moodColor = unHappyColor; title = "รู้สึกแย่"; break;
      case "Normal": icon = "assets/pictures/cNormal2.png"; moodColor = normalColor; title = "ปกติ"; break;
      case "Happy": icon = "assets/pictures/cHappy2.png"; moodColor = happyColor; title = "รู้สึกดี"; break;
      case "Maniac": icon = "assets/pictures/cManiac2.png"; moodColor = maniacColor; title = "คึกคัก/โกรธง่าย"; break;
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
                // border: Border.all(
                //   width: 3,
                //   color: moodColor,
                // ),
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