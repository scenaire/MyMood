import 'package:flutter/material.dart';
import 'package:mymood/Screens/Home/MyHomePage.dart';
import 'package:mymood/Services/Auth.dart';
import 'package:mymood/Widgets/loadingPage.dart';
import 'package:password_strength/password_strength.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String email, password, confirmPassword = '';

  final AuthService _auth = AuthService();
  String error = ' ';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var iconThemeData = IconThemeData(color: Theme.of(context).primaryColor);
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: iconThemeData,
        elevation: 0,
        title: Text(
          'สมัครสมาชิก',
          style: TextStyle(
              fontFamily: 'Anakotmai Medium',
              color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/pictures/register.jpg')),
                Container(
                    margin: EdgeInsets.only(bottom: 40),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'อีเมล์'),
                            onChanged: (String input) {
                              setState(() {
                                email = input;
                              });
                            },
                            validator: emailValidation,
                          ),

                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'รหัสผ่าน'),
                            onChanged: (String input) {
                              setState(() {
                                password = input;
                              });
                            },
                            obscureText: true,
                            validator: passwordValidation,
                          ),

                          TextFormField(
                            decoration: const InputDecoration(labelText: 'ยืนยันรหัสผ่าน'),
                            onChanged: (String input) {
                              setState(() {
                                confirmPassword = input;
                              });
                            },
                            obscureText: true,
                            validator: confirmPasswordValidation,
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 35),
                            child: RaisedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.registerUser(
                                      email.trim(),
                                      password.trim());
                                  if (result == null) {
                                    setState(() {
                                      error = 'Error Message something';
                                      loading = false;
                                    });
                                  } else {
                                      loading =false;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage(user: result, currentPage: 0,)));
                                  }
                                }
                              },
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              child: Text(
                                'สมัครสมาชิกเลย',
                                style: TextStyle(
                                    fontFamily: 'Prompt',
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
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
    return 'อีเมล์ไม่ถูกต้องค่ะ';
  }

  String passwordValidation(String value) {
    if(value.isEmpty) {
      return "กรุณากรอกข้อมูล";
    } 

    double passwordStr = estimatePasswordStrength(value.trim());

    if (passwordStr < 0.3) {
      return "This password is weak";
    } else if (passwordStr < 0.7) {
      return null;
    }

    return null;

  }

  String confirmPasswordValidation(String value) {
    if (value.isEmpty) {
      return "กรุณากรอกข้อมูลเพื่อยืนยันรหัสผ่าน";
    } 
    
    if (value.trim() != password.trim()) {
      return "รหัสผ่านไม่ตรงกัน";
    }

    return null;


  }

  
  
}