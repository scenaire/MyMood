import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
            title: Text('สมัครสมาชิก', style: TextStyle(fontFamily: 'Anakotmai Medium', color: indigo),),
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
                  image: AssetImage('assets/pictures/register.jpg')
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
                        validator: emailValidation,
                      ),

                      TextFormField(
                        decoration: const InputDecoration(labelText: 'รหัสผ่าน'),
                        onSaved: (String value) {
                          password = value;
                        },
                        validator: emailValidation,
                        obscureText: true,
                      ),

                      TextFormField(
                        decoration: const InputDecoration(labelText: 'ยืนยันรหัสผ่าน'),
                        onSaved: (String value) {
                          email = value;
                        },
                        validator: emailValidation,
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
                          'สมัครสมาชิกเลย',
                          style:
                            TextStyle(fontFamily: 'Prompt', fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
              ],
            ),
          ),
        ),
        ),
        );
  }

  String emailValidation(String value) {
  if (value.isEmpty) {
    // The form is empty
    return "Enter email address";
  }
  // This is just a regular expression for email addresses
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(value)) {
    // So, the email is valid
    return null;
  }

  // The pattern of the email didn't match the regex above.
  return 'Email is not valid';
  }
}