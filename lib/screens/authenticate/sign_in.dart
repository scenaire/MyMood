import 'package:flutter/material.dart';
import 'package:mymood/Screens/Home/MyHomePage.dart';
import 'package:mymood/Services/Auth.dart';
import 'package:mymood/Widgets/loadingPage.dart';

import 'forgotten.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _autoValidate = false;

  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var iconThemeData = IconThemeData(color: Theme.of(context).primaryColor);
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: iconThemeData,
              elevation: 0,
              title: Text(
                'เข้าสู่ระบบ',
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
                      Image(image: AssetImage('assets/pictures/signin.png')),
                      Container(
                          margin: EdgeInsets.only(bottom: 40),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'อีเมล์'),
                                  controller: _emailController,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'รหัสผ่าน'),
                                  controller: _passwordController,
                                  obscureText: true,
                                ),
                              ],
                            ),
                          )),
                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth.signInwithEmail(_emailController.text.trim(),_passwordController.text.trim());

                            if (result == null) {
                              setState(() {
                                loading = false;
                              });
                            } else {
                              setState(() {
                                loading = false;
                                print("hi there you now you'll transfer to homepage with account: " + result.uid);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: result)));
                              });
                            }
                          }
                        },
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                              fontFamily: 'Prompt',
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'จำไม่ได้เหรอ? ',
                                style: TextStyle(
                                    fontFamily: 'Prompt',
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                              new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgottenPassword()));
                                },
                                child: Text(
                                  'ลืมรหัสผ่าน',
                                  style: TextStyle(
                                      fontFamily: 'Prompt',
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}