import 'package:flutter/material.dart';

class ForgottenPassword extends StatefulWidget {
  @override
  _ForgottenPasswordState createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  
  final Color indigo = const Color.fromARGB(255, 56, 56, 223);

  String email;
  
  @override
  Widget build(BuildContext context) {
    var iconThemeData = IconThemeData(color: indigo);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: iconThemeData,
            elevation: 0,
            title: Text('ลืมรหัสผ่าน', style: TextStyle(fontFamily: 'Anakotmai Medium', color: indigo),),
            centerTitle: true,
          ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/pictures/forgotPassword.png')
                ),

              Container(
                margin: EdgeInsets.only(bottom:10),
                child: Column(children: <Widget>[
                  Text(
                'กรุณากรอกอีเมลของคุณ',
                style: 
                  TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
                ),

              Text(
                'หากคุณเคยสมัครสมาชิกกับเรา',
                style: 
                  TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
              ),

              Text(
                'ระบบจะส่งอีเมลสำหรับการรีเซตรหัสผ่าน',
                style: 
                  TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
                ),
                ],)
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal:30),
                margin: EdgeInsets.only(bottom:30),
                child: TextFormField(
                        decoration: const InputDecoration(labelText: 'อีเมล์'),
                        onSaved: (String value) {
                          email = value;
                        },
                      ),
              ),

              //TODO: Implement Forgot Password 

              RaisedButton(
                        onPressed: () {
                                                  
                        },
                        color: indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(horizontal:30.0,vertical: 8.0),
                        child: Text(
                          'รีเซ็ตรหัสผ่่าน',
                          style:
                            TextStyle(fontFamily: 'Prompt', fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),

              ],
            ),
          ),
        )
      ),
    );
  }
}