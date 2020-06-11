//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/quizpage/ResultPage.dart';

class EightQPage extends StatefulWidget {

  final User user;

  EightQPage({Key key, this.user}) : super(key: key);

  @override
  _EightQPageState createState() => _EightQPageState();
}

class _EightQPageState extends State<EightQPage> {

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
          new Text('แบบประเมิน 8Q', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 16, color: const Color.fromARGB(255, 40, 40, 40))),
          new Text('เพื่อประเมินความเสี่ยงของการทำร้ายตนเอง', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600])),
          new Padding(padding: EdgeInsets.all(8.0),),
          //new Divider(height: 5.0, color: Colors.black),
          new Padding(padding: EdgeInsets.all(8.0),),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
          
          new Text('ข้อที่ 1', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('มีความคิดอยากตาย หรือ คิดว่าตายไปจะดีกว่า', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 1, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('มี'),

              new Radio( value: 0, groupValue: _radioValue1, onChanged: (val) { setState(() { _radioValue1 = val; }); }, ),
              new Text('ไม่มี'),
              
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          //Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          
          new Text('ข้อที่ 2', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('มีความคิดอยากทำร้ายตัวเอง หรือ ทำให้ตัวเองบาดเจ็บ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 2, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('มี'),

              new Radio( value: 0, groupValue: _radioValue2, onChanged: (val) { setState(() { _radioValue2 = val; }); }, ),
              new Text('ไม่มี'),
              
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom:24.0, top: 15.0),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.amber),
              borderRadius: BorderRadius.all(Radius.circular(16.0))
            ),
            child: Column(
              children: <Widget> [
                Text('คำถามข้อที่ 3  - 5', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
                Text('ครอบคลุมระยะ 1 เดือนที่ผ่านมารวมถึงวันนี้', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
              ]
            )
          ),

          new Text('ข้อที่ 3', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('มีความคิดเกี่ยวกับการฆ่าตัวตาย', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 6, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('มี'),

              new Radio( value: 0, groupValue: _radioValue3, onChanged: (val) { setState(() { _radioValue3 = val; }); }, ),
              new Text('ไม่มี'),
              
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          //Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ท่านสามารถควบคุมความอยากฆ่าตัวตายที่ท่านคิดอยู่นั้นได้หรือไม่ บอกได้ไหมว่าจะไม่ทำตามความคิดนั้นในขณะนี้', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 8, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('ไม่ได้'),

              new Radio( value: 0, groupValue: _radioValue4, onChanged: (val) { setState(() { _radioValue4 = val; }); }, ),
              new Text('ได้'),
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          //Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 4', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('มีแผนการที่จะฆ่าตัวตาย', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 8, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('มี'),

              new Radio( value: 0, groupValue: _radioValue5, onChanged: (val) { setState(() { _radioValue5 = val; }); }, ),
              new Text('ไม่มี'),
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          //Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 5', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('ได้เตรียมการที่จะทำร้ายตนเองหรือเตรียมการที่จะฆ่าตัวตายโดยตั้งใจว่าจะให้ตายจริงๆ', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 9, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue6, onChanged: (val) { setState(() { _radioValue6 = val; }); }, ),
              new Text('ไม่ใช่'),
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 6', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('ได้ทำให้ตนเองบาดเจ็บ แต่ไม่ตั้งใจที่จะทำให้เสียชีวิต', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 4, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue7, onChanged: (val) { setState(() { _radioValue7 = val; }); }, ),
              new Text('ไม่ใช่'),
              
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          //Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 7', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('ได้พยายามฆ่าตัวตายโดยคาดหวัง / ตั้งใจที่จะให้ตาย', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 10, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue8, onChanged: (val) { setState(() { _radioValue8 = val; }); }, ),
              new Text('ไม่ใช่'),
              ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          //Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 8', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('ตลอดชีวิตที่ผ่านมา ท่านเคยพยายามฆ่าตัวตาย', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( value: 4, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('ใช่'),

              new Radio( value: 0, groupValue: _radioValue9, onChanged: (val) { setState(() { _radioValue9 = val; }); }, ),
              new Text('ไม่ใช่'),
              
              ]
            ),
          ),


          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          //Divider(height: 5, color: Colors.black,),
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizResult(user: widget.user, quiz: 8, result: _result,)));
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