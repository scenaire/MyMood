import 'package:flutter/material.dart';

class InsAboutMood extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));

    return Scaffold(

      backgroundColor: Colors.white,

      //*********************Appbar */
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
        child: SingleChildScrollView(
          child: Center(

            child: Column (children: <Widget>[

              Padding(padding: EdgeInsets.only(top: 30)),

              Text('อารมณ์ในรูปแบบต่างๆ', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),

              Padding(padding: EdgeInsets.only(top: 30)),

              Image.asset('assets/pictures/cManiac2.png'),
              Text('มีความสุขมาก', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 16, color: Color(0xFFF2695C)), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(top: 10)),
              //Text('มีความสุขมาก', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),

              Padding(padding: EdgeInsets.only(top: 30)),

              Image.asset('assets/pictures/cHappy2.png'),
              Text('รู้สึกดี', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 16, color: Color(0xFFF29580)), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(top: 10)),
              //Text('มีความสุขมาก', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),

              Padding(padding: EdgeInsets.only(top: 30)),

              Image.asset('assets/pictures/cNormal2.png'),
              Text('ปกติ', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 16, color: Color(0xFFf5d791)), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(top: 10)),
              //Text('มีความสุขมาก', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),

              Padding(padding: EdgeInsets.only(top: 30)),

              Image.asset('assets/pictures/cUnhappy2.png'),
              Text('รู้สึกแย่', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 16, color: Color(0xFFADD4D9)), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(top: 10)),
              //Text('มีความสุขมาก', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),

              Padding(padding: EdgeInsets.only(top: 30)),

              Image.asset('assets/pictures/cDepress2.png'),
              Text('เศร้ามาก', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 16, color: Color(0xFF85A2A6)), textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(top: 10)),
              //Text('มีความสุขมาก', style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.center,),

            ],)

          ),
        ),
      )

    );
  }
}