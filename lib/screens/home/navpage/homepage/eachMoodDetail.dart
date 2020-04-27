import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Services/thCalendar.dart';

class MoodDetail extends StatefulWidget {

  final Mood mood; 

  MoodDetail({Key key, this.mood}) : super (key: key);

  @override
  _MoodDetailState createState() => _MoodDetailState();
}

class _MoodDetailState extends State<MoodDetail> {



  @override
  Widget build(BuildContext context) {

    var iconThemeData = IconThemeData(color: Theme.of(context).primaryColor);

    String icon;
    Color moodColor;
    THCalendar thCal = new THCalendar();
    String title;

    switch (widget.mood.type) {
      case "Depress": icon = "assets/pictures/depress.png"; moodColor = Colors.deepPurple[400]; title = "เศร้ามาก" ; break;
      case "Unhappy": icon = "assets/pictures/sad.png"; moodColor = Colors.blue[400]; title = "รู้สึกแย่"; break;
      case "Normal": icon = "assets/pictures/normal.png"; moodColor = Colors.blueGrey[400]; title = "ปกติ"; break;
      case "Happy": icon = "assets/pictures/happy.png"; moodColor = Colors.amber[400]; title = "รู้สึกดี"; break;
      case "Maniac": icon = "assets/pictures/mania.png"; moodColor = Colors.pink[400]; title = "มีความสุขมาก"; break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: iconThemeData,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        // title: Text(
        //   thCal.changetoThaiDate(widget.mood.time),
        //   style: TextStyle(
        //       fontFamily: 'Anakotmai Medium',
        //       fontSize: 16,
        //       color: Theme.of(context).primaryColor),
        // ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                    child: Column(

                      children: <Widget>[

                        Text(
                    thCal.changetoThaiDate(widget.mood.time),
                    style: TextStyle(fontFamily: 'Prompt', fontSize: 22, color: moodColor, fontWeight: FontWeight.w500),
                    ),

                    Text(
                    thCal.timeFormatted(widget.mood.time),
                    style: TextStyle(fontFamily: 'Prompt', fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),
                    )

                      ],

                  ),
                ),
              ),

              Center(child: Image.asset(
                icon,
              ),),

                Text(
                    title,
                    style: TextStyle(fontFamily: 'Prompt', fontSize: 22, color: moodColor, fontWeight: FontWeight.w500),
                    ),

                Container(
                  margin: EdgeInsets.symmetric(vertical : 20),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        widget.mood.message,
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey[700],)
                      )
                ),
                  )
                )


              

            ],
          )
        ),
      ),
    );
  }
}