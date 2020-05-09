import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/quizpage/ResultPage.dart';

class TwoQPage extends StatefulWidget {

  final User user;

  TwoQPage({Key key, this.user}) : super(key: key);

  @override
  _TwoQPageState createState() => _TwoQPageState();
}

class _TwoQPageState extends State<TwoQPage> {


  var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));

  int _result = 0;
  int _radioValue1 = 0;
  int _radioValue2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      //*********************Appbar */
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconThemeData,
        elevation: 0,
        // title: Text(
        //   'ทำแบบประเมิน',
        //   style: TextStyle(fontFamily: 'Anakotmai Medium', color: const Color.fromARGB(255, 40, 40, 40)),
        // ),
        centerTitle: true,
      ),

      body: Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          new Text('แบบคัดกรอง 2Q', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 16, color: const Color.fromARGB(255, 40, 40, 40))),
          new Text('เพื่อคัดกรองความเสี่ยงของโรคซึมเศร้าเบื้องต้น', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600])),
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
            child: new Text('คำถามต่อไปนี้ครอบคลุมระยะ 2 สัปดาห์ที่ผ่านมารวมถึงวันนี้', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 14, color: Colors.black), textAlign: TextAlign.center,),
          ),
          
          new Text('ข้อที่ 1', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('ท่านรู้สึกหดหู่ เศร้า หรือท้อแท้สิ้นหวังหรือไม่', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( 
                value: 1, 
                groupValue: _radioValue1, 
                onChanged: (val) {
                  setState(() {
                    _radioValue1 = val;
                  });
                },
              ),
              new Text('ใช่'),
              new Radio( value: 0, 
                  groupValue: _radioValue1, 
                  onChanged: (val) {
                  setState(() {
                    _radioValue1 = val;
                  });
                },
              ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),

          Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Divider(height: 5, color: Colors.black,),
          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),

          new Text('ข้อที่ 2', style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 16, color: Colors.black)),
          new Text('ท่านรู้สึกเบื่อ ทำอะไรก็ไม่เพลิดเพลินหรือไม่', style: TextStyle(fontFamily: 'prompt', fontSize: 16, color: Colors.black,), textAlign: TextAlign.center,),
          new Container(
            width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new Radio( 
                value: 1, 
                groupValue: _radioValue2, 
                onChanged: (val) {
                  setState(() {
                    _radioValue2 = val;
                  });
                },
              ),
              new Text('ใช่'),
              new Radio( value: 0, groupValue: _radioValue2, 
                  onChanged: (val) {
                  setState(() {
                    _radioValue2 = val;
                  });
                },
              ),
              new Text('ไม่ใช่'),
            ]
            ),
          ),
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
                        _result = _radioValue1 + _radioValue2;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizResult(user: widget.user, quiz: 2,result: _result,)));
                      },
                      child: Text(
                        "บันทึก",
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
          ),
          )

        ]
      ),
      ),

      );
  }
}
