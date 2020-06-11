//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/material.dart';
import 'Register.dart';
import 'sign_in.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:40,bottom:10),
                  child: Text(
                  'ยินดีต้อนรับ',
                  style: 
                    TextStyle(fontFamily: 'Anakotmai Medium', fontSize: 28, color: Theme.of(context).primaryColor),
                  ),
                ),

                Image(
                  image: AssetImage('assets/pictures/welcome2.png')
                  ),

                Container(
                  margin: EdgeInsets.only(bottom:60.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'แอปพลิเคชันติดตามอารมณ์สำหรับคนไทย',
                        style: 
                          TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
                      ),

                      Text(
                        'ที่จะทำให้คุณเข้าใจตนเองได้ดียิ่งขึ้น',
                        style: 
                        TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
                      ),
                    ]
                  ),
                ),
                
                RaisedButton(
                  onPressed: () {
                    navigateToRegister(context);
                  },
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal:45.0,vertical: 10.0),
                  child: Text(
                    'สมัครสมาชิกเลย',
                    style:
                      TextStyle(fontFamily: 'Prompt', fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top:20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'เป็นสมาชิกอยู่แล้ว?',
                        style: 
                          TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
                      ),

                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                        },
                        child: Text(
                        'เข้าสู่ระบบ',
                          style: 
                            TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Theme.of(context).primaryColor),
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future navigateToRegister(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
  }

}