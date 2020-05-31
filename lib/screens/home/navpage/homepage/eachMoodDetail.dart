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
                Text('เราตรวจพบว่าคุณมีความเสี่ยงในการทำร้ายตนเอง', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('โปรดปรึกษาจิตแพทย์หรือสายด่วนสุขภาพจิตโดยด่วน', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
              ]
            )
          );
  }

  Widget notificationDepress() {

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
                Text('เราตรวจพบว่าคุณมีความเสี่ยงในการเป็นโรคซึมเศร้า', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
                Text('โปรดปรึกษาจิตแพทย์หรือสายด่วนสุขภาพจิตโดยด่วน', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),
              ]
            )
          );
  }


  @override
  Widget build(BuildContext context) {

    var iconThemeData = IconThemeData(color: Colors.black);

    String icon;
    Color moodColor;
    THCalendar thCal = new THCalendar();
    String title;

    const Color unHappyColor = Color(0xFFADD4D9);
    const Color depressColor = Color(0xFF85A2A6);
    const Color normalColor = Color(0xFFf5d791);
    const Color happyColor = Color(0xFFF29580);
    const Color maniacColor = Color(0xFFF2695C);


    switch (widget.mood.type) {
      case "Depress": icon = "assets/pictures/cDepress2.png"; moodColor = depressColor; title = "เศร้ามาก" ; break;
      case "Unhappy": icon = "assets/pictures/cUnhappy2.png"; moodColor = unHappyColor; title = "รู้สึกแย่"; break;
      case "Normal": icon = "assets/pictures/cNormal2.png"; moodColor = normalColor; title = "ปกติ"; break;
      case "Happy": icon = "assets/pictures/cHappy2.png"; moodColor = happyColor; title = "รู้สึกดี"; break;
      case "Maniac": icon = "assets/pictures/cManiac2.png"; moodColor = maniacColor; title = "มีความสุขมาก"; break;
    }

    

    List<TextSpan> getTextSpan() {
      List<TextSpan> list = new List<TextSpan>();
      List<String> cutSuicidal = List<String>();
      List<String> cutNegative = List<String>();
      List<int> suicideStack = List<int>();
      List<int> negativeStack = List<int>();

      //Set cut word

      if(widget.mood.negative.trim().isNotEmpty) {
        cutNegative = widget.mood.negative.split(',');
      }

      if(widget.mood.suicidal.trim().isNotEmpty) {
        cutSuicidal = widget.mood.suicidal.split(',');
      }

      //Add index of string to the stacks

      if (cutNegative.length > 0 && cutSuicidal.length == 0) { //มีเนกาทีฟ แต่ไม่มีเซลฟ์ฮาร์ม

        for (int i=0; i<cutNegative.length; i++) {
           List<String> sp = cutNegative[i].split('-');
           for (int i=int.parse(sp[0]); i<=int.parse(sp[1]); i++) {
             negativeStack.add(i);
           }
        }

      } else if (cutSuicidal.length > 0 && cutNegative.length == 0) { //มีเซลฟ์ฮาร์ม ไม่มีเนกาทีฟ

        for (int i=0; i<cutSuicidal.length; i++) {
           List<String> sp = cutSuicidal[i].split('-');
           for (int i=int.parse(sp[0]); i<=int.parse(sp[1]); i++) {
             suicideStack.add(i);
           }
        }

      } else if (cutSuicidal.length > 0 && cutNegative.length > 0) { //มีทั้งสองอย่าง

        for (int i=0; i<cutNegative.length; i++) {
           List<String> sp = cutNegative[i].split('-');
           for (int i=int.parse(sp[0]); i<=int.parse(sp[1]); i++) {
             negativeStack.add(i);
           }
        }

        for (int i=0; i<cutSuicidal.length; i++) {
           List<String> sf = cutSuicidal[i].split('-');
           for (int i=int.parse(sf[0]); i<=int.parse(sf[1]); i++) {
             suicideStack.add(i);
           }
        }

      }

      //Add list!

      for (int i=0; i<widget.mood.message.length; i++) {

        if (suicideStack.contains(i)) {
          list.add(TextSpan(text: widget.mood.message[i], style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: depressColor),));
        } else if (negativeStack.contains(i)) {
          list.add(TextSpan(text: widget.mood.message[i], style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: depressColor),));
        } else {
          list.add(TextSpan(text: widget.mood.message[i], style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey[700]),));
        }

      }

      return list;
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
                icon, height: 120,
              ),),

                Text(
                    title,
                    style: TextStyle(fontFamily: 'Prompt', fontSize: 22, color: moodColor, fontWeight: FontWeight.w500),
                    ),

                widget.mood.suicidal.trim().isNotEmpty ? notificationSuicidal() : widget.mood.negative.trim().isNotEmpty ? notificationDepress() : Container(),

                Container(
                  margin: EdgeInsets.symmetric(vertical : 20, horizontal: 30),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child:

                      RichText(
                      text: TextSpan(
                        text: '', style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey[700],),

                        children: getTextSpan(),

                        // <TextSpan>[
                        //   TextSpan(text: 'Hello ', ),
                        //   TextSpan(text: 'bold', style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.pink[400],)),
                        //   TextSpan(text: ' world!'),
                        // ],
                      ),
                      )

                      // Text(
                      //   widget.mood.message,
                      //   style: TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey[700],)
                      // )
                ),
                  )
                ),


            ],
          )
        ),
      ),
    );
  }
}