//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/quizpage/MDQTWOPage.dart';
import 'package:mymood/Screens/Home/quizpage/ResultPage.dart';

class MDQPage extends StatefulWidget {

  final User user;

  MDQPage({Key key, this.user}) : super(key: key);

  @override
  _MDQPageState createState() => _MDQPageState();
}

class _MDQPageState extends State<MDQPage> {

  int _result = 0;
  int _radioValue1 = 0;
  int _radioValue2 = 0;
  int _radioValue3 = 0;
  int _radioValue4 = 0;
  int _radioValue5 = 0;
  int _radioValue6 = 0;
  int _radioValue7 = 0;
  int _radioValue8 = 0;
  int _radioValue9 = 0;
  int _radioValue10 = 0;
  int _radioValue11 = 0;
  int _radioValue12 = 0;
  int _radioValue13 = 0;
  int _radioValue14 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      //*********************Appbar */
      appBar: AppBar(
        backgroundColor: Colors.white,
        //iconTheme: iconThemeData,
        elevation: 0,
        // title: Text(
        //   'ทำแบบประเมิน',
        //   style: TextStyle(fontFamily: 'Anakotmai Medium', color: const Color.fromARGB(255, 40, 40, 40)),
        // ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          new Text('แบบประเมิน MDQ', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 16, color: const Color.fromARGB(255, 40, 40, 40))),
          new Text('เพื่อคัดกรองผู้ที่มีความเสี่ยงโรคอารมณ์แปรปรวนสองชั้ว', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600])),
          new Padding(padding: EdgeInsets.all(8.0),),
          new Divider(height: 5.0, color: Colors.black),
          new Padding(padding: EdgeInsets.all(8.0),),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
          // Container(
          //   padding: EdgeInsets.all(10.0),
          //   margin: EdgeInsets.only(bottom:24.0),
          //   decoration: BoxDecoration(
          //     border: Border.all(width: 2, color: Colors.amber),
          //     borderRadius: BorderRadius.all(Radius.circular(16.0))
          //   ),
          //   child: Column(
          //     children: <Widget> [
          //       new Text('คำถามต่อไปนี้ครอบคลุมระยะ 2 สัปดาห์ที่ผ่านมารวมถึงวันนี้', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          //       new Text('ท่านมีอาการดังต่อไปนี้บ่อยแค่ไหน', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          //       new Text('โดยให้คะแนนจาก 0 - 3', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          //       new Text('0 = ไม่มีเลย', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          //       new Text('1 = ตั้งแต่ 1 - 7 วัน', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          //       new Text('2 = มากกว่า 7 วันขึ้นไป', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          //       new Text('3 = เป็นทุกวัน', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          //     ]
          //   )
          // ),
          
          new Text('ข้อที่ 1', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('เคยมีช่วงระยะเวลาใดเวลาหนึ่งของชีวิตที่ผ่านมา', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Text('ที่คุณรู้สึกไม่เป็นตัวของตัวเองตามปกติ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('ไม่ใช่'),
              
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          
          new Text('ข้อที่ 2', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณรู้สึกอารมณ์ดีมากๆ หรือกระตือรือร้นมากๆ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Text('จนผู้อื่นคิดว่าคุณไม่ปกติ หรือคุณทำอะไรมากเกินไป', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Text('จนทำให้ตัวคุณเองเดือดร้อน', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 3', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณหงุดหงิดง่ายจนคุณพูดเสียงดังใส่คนอื่น', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Text('หรือก่อเหตุทะเลาะวิวาท หรือชกต่อยกัน', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 4', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณรู้สึกมั่นใจในตนเองมากกว่าปกติ?', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 5', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณนอนน้อยลงกว่าปกติมาก และรู้สึกเหมือนไม่ได้อดนอน', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('ไม่ใช่'),
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 6', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณพูดมากขึ้น หรือพูดเร็วมากกว่าปกติ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 7', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณมีความคิดพลุ่งพล่าน หรือคุณไม่สามารถสงบจิตใจได้?', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 8', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณวอกแวกกับสิ่งต่าง ๆ รอบตัวคุณได้ง่าย จนคุณไม่มีสมาธิ หรือไม่สามารถจดจ่อในเรื่องใดเรื่องหนึ่ง', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 9', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณมีเรี่ยวแรงมากกว่าปกติ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 10', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณกระฉับกระเฉงมากขึ้น หรือทำสิ่งต่างๆ มากกว่าปกติ?', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue10, onChanged: (val) { setState(() { _radioValue10 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue10, onChanged: (val) { setState(() { _radioValue10 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 11', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณชอบเข้าสังคม หรือพบปะผู้คนมากกว่าปกติ เช่น คุยโทรศัพท์หาเพื่อนกลางดึก', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue11, onChanged: (val) { setState(() { _radioValue11 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue11, onChanged: (val) { setState(() { _radioValue11 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 12', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณมีความสนใจในเรื่องทางเพศมากกว่าปกติ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue12, onChanged: (val) { setState(() { _radioValue12 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue12, onChanged: (val) { setState(() { _radioValue12 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 13', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณทำสิ่งต่างๆ ที่ผิดวิสัยของคุณ หรือทำสิ่งที่ผู้อื่นอาจคิดว่ามันมากเกินควร หรือมีความเสี่ยง', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue13, onChanged: (val) { setState(() { _radioValue13 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue13, onChanged: (val) { setState(() { _radioValue13 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 14', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คุณใช้จ่ายเงินจนทำให้ตัวเอง หรือครอบครัวของคุณเดือดร้อน', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue14, onChanged: (val) { setState(() { _radioValue14 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue14, onChanged: (val) { setState(() { _radioValue14 = val; }); }, ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),



              ],
            )
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),

          ButtonTheme(
            minWidth: 150.0,
            height: 50.0,
            child: RaisedButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
                      color: Theme.of(context).primaryColor,
                      elevation: 0.0,
                      onPressed: () {
                        _result = _radioValue1 + _radioValue2 + _radioValue3 + _radioValue4 + _radioValue5 + _radioValue6 + _radioValue7 + _radioValue8 + _radioValue9 + _radioValue10  + _radioValue11 + _radioValue12 + _radioValue13 + _radioValue14;
                        if (_result == 0) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizResult(user: widget.user, quiz: 0, result: _result, isBipolar: false,)));
                        } else {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MDQTWOPage(user: widget.user, score: _result,)));
                        }
                        
                      },
                      child: Text(
                        "ส่งคำตอบชุดที่ 1",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
          ),
          ),

          Padding(padding: EdgeInsets.only(bottom: 50))

        ]
      ),
      ),
      )

      );
  }
}