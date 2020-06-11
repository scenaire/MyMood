//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/quizpage/ResultPage.dart';

class NineQPage extends StatefulWidget {

  final User user;

  NineQPage({Key key, this.user}) : super(key: key);

  @override
  _NineQPageState createState() => _NineQPageState();
}

class _NineQPageState extends State<NineQPage> {

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
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          new Text('แบบประเมิน 9Q', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 16, color: const Color.fromARGB(255, 40, 40, 40))),
          new Text('เพื่อประเมินความเสี่ยงของโรคซึมเศร้า', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600])),
          new Padding(padding: EdgeInsets.all(8.0),),
          new Divider(height: 5.0, color: Colors.black),
          new Padding(padding: EdgeInsets.all(8.0),),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom:24.0),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.amber),
              borderRadius: BorderRadius.all(Radius.circular(16.0))
            ),
            child: Column(
              children: <Widget> [
                new Text('คำถามต่อไปนี้ครอบคลุมระยะ 2 สัปดาห์ที่ผ่านมารวมถึงวันนี้', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
                new Text('ท่านมีอาการดังต่อไปนี้บ่อยแค่ไหน', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
                new Text('โดยให้คะแนนจาก 0 - 3', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
                new Text('0 = ไม่มีเลย', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
                new Text('1 = ตั้งแต่ 1 - 7 วัน', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
                new Text('2 = มากกว่า 7 วันขึ้นไป', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
                new Text('3 = เป็นทุกวัน', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
              ]
            )
          ),
          
          new Text('ข้อที่ 1', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('เบื่อ ไม่สนใจอยากทำอะไร', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          
          new Text('ข้อที่ 2', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('ไม่สบายใจ ซึมเศร้า ท้อแท้', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 3', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('หลับยาก หรือหลับๆ ตื่นๆ หรือหลับมากไป', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 4', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('เหนื่อยง่าย หรือไม่ค่อยมีแรง', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 5', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('เบื่ออาหารหรือกินมากเกินไป', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 6', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('รู้สึกไม่ดีกับตัวเอง คิดว่าตัวเองล้มเหลว', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Text('หรือทำให้ครอบครัวผิดหวัง', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 7', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('สมาธิไม่ดีเวลาทำสิ่งต่างๆ เช่น ดูโทรทัศน์', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Text('ฟังวิทยุ หรืองานที่ต้องใช้สมาธิ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 8', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('พูดช้า ทำอะไรช้าลงจนคนอื่นสังเกตได้ หรือ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Text('กระสับกระส่ายไม่สามารถอยู่นิ่งได้เหมือนที่เคยเป็น', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 9', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('คิดทำร้ายตนเอง หรือคิดว่าตายไปก็คงจะดี', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 0, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('0'),

              new Radio( value: 1, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('1'),
              
              new Radio( value: 2, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('2'),

              new Radio( value: 3, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('3'),
            ]
            ),
          ),


          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
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
                        _result = _radioValue1 + _radioValue2 + _radioValue3 + _radioValue4 + _radioValue5 + _radioValue6 + _radioValue7 + _radioValue8 + _radioValue9;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizResult(user: widget.user, quiz: 9, result: _result,)));
                      },
                      child: Text(
                        "บันทึก",
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