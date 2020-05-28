import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/quizpage/TwoQPage.dart';

class InstructionMain extends StatelessWidget {

  final User user;

  InstructionMain ({Key key, this.user}) : super(key: key);
  var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconThemeData,
        elevation: 0,
        title: Text(
          'คำแนะนำการใช้งาน',
          style: TextStyle(fontFamily: 'Anakotmai Medium', color: const Color.fromARGB(255, 40, 40, 40)),
        ),
        centerTitle: true,
      ),

      body: Container(

        color: Colors.white,
        

        child: Center(
          child: Column(
          children: <Widget>[

            Padding(padding: EdgeInsets.only(top: 170)),

            Text('ก่อนเริ่มใช้งานแอปพลิเคชัน',style: TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 20, color: Theme.of(context).primaryColor),),


            Image.asset('assets/pictures/quiz.png'),

            Padding(padding: EdgeInsets.only(top: 20)),


            Text('เราอยากให้คุณลองประเมินความเสี่ยงโรคซึมเศร้า \nด้วยตนเองดูก่อน เพื่อที่คุณจะได้เข้าใจตนเองดียิ่งขึ้น', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey), textAlign: TextAlign.center,),

            Padding(padding: EdgeInsets.only(top: 40)),

            RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => TwoQPage(user: this.user)));
                  },
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal:30.0,vertical: 10.0),
                  child: Text(
                    'ทำแบบประเมิน',
                    style:
                      TextStyle(fontFamily: 'Prompt', fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
            
        ],),
        )
      ),


    );
  }
}