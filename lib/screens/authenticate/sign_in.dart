import 'package:flutter/material.dart';
import 'package:mymood/screens/authenticate/forgotten.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final Color indigo = const Color.fromARGB(255, 56, 56, 223);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
            var iconThemeData = IconThemeData(
              color: indigo);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: iconThemeData,
            elevation: 0,
            title: Text('เข้าสู่ระบบ', style: TextStyle(fontFamily: 'Anakotmai Medium', color: indigo),),
            centerTitle: true,
          ),
          body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom:30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Image(
                  image: AssetImage('assets/pictures/signin.png')
                  ),

                Container(
                  margin: EdgeInsets.only(bottom:40),
                  padding: EdgeInsets.symmetric(horizontal:30),
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'อีเมล์'),
                        onSaved: (String value) {
                          email = value;
                        },
                      ),

                      TextFormField(
                        decoration: const InputDecoration(labelText: 'รหัสผ่าน'),
                        onSaved: (String value) {
                          password = value;
                        },
                        obscureText: true,
                      ),

                    ],
                    ),
                      )
                ),
                                              
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
                          'เข้าสู่ระบบ',
                          style:
                            TextStyle(fontFamily: 'Prompt', fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),

                  Container(
                  margin: EdgeInsets.only(top:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'จำไม่ได้เหรอ? ',
                        style: 
                          TextStyle(fontFamily: 'Prompt', fontSize: 14, color: Colors.grey),
                      ),

                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgottenPassword()));
                        },
                        child: Text(
                        'ลืมรหัสผ่าน',
                          style: 
                            TextStyle(fontFamily: 'Prompt', fontSize: 14, color: indigo),
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

  

}