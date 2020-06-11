//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';

import 'ResultPage.dart';

class MDQTWOPage extends StatefulWidget {


  final User user;
  final int score;

  MDQTWOPage({Key key, this.user, this.score}) : super(key: key);

  @override
  _MDQTWOPageState createState() => _MDQTWOPageState();
}

class _MDQTWOPageState extends State<MDQTWOPage> {


  int _result = 0;
  int _radioValue1 = 0;
  int _radioValue2 = 0;
  bool isBipolar = false;

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
          new Text('เหตุการณ์ต่างๆ ในชุดที่แล้วส่วนใหญ่เกิดขึ้นในช่วงระยะเวลาใกล้เคียงกันหรือไม่', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
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
          new Text('เหตุการณ์ต่าง ๆ เหล่านี้ส่งผลกระทบต่อคุณในขณะนั้นมากเพียงใด เช่น มีผลให้คุณทำงานไม่ได้, มีปัญหาในครอบครัว, ด้านการเงิน, หรือ ด้านกฎหมาย ทำให้คุณเข้าไปมีส่วนในการโต้เถียง หรือ ทะเลาะวิวาท', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Radio( value: 0, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
                  new Text('ไม่ก่อปัญหา'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Radio( value: 1, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
                  new Text('ก่อปัญหาเล็กน้อย'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Radio( value: 2, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
                  new Text('ก่อปัญหาปานกลาง'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Radio( value: 3, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
                  new Text('ก่อปัญหารุนแรง'),
                ],
              ),

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
                        if (_radioValue1 == 1 && _radioValue2 > 1) {
                          isBipolar = true;
                        } else {
                          isBipolar = false;
                        }
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizResult(user: widget.user, quiz: 0, result: _result, isBipolar: isBipolar,)));
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