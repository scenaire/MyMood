import 'package:flutter/material.dart';
import 'package:mymood/services/auth.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Color indigo = const Color.fromARGB(255, 56, 56, 223);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _autoValidate = false;

  final AuthService _auth = AuthService();
  

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
                        controller: _emailController,
                        validator: emailValidation,
                      ),

                      TextFormField(
                        decoration: const InputDecoration(labelText: 'รหัสผ่าน'),
                        controller: _passwordController,
                        obscureText: true,
                      ),

                      //TODO: เช็คว่าตรงกับรหัสข้างบนมั้ย

                      TextFormField(
                        decoration: const InputDecoration(labelText: 'ยืนยันรหัสผ่าน'),
                        obscureText: true,
                      ),

                      Container(
                        margin: EdgeInsets.only(top:35),
                        child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _auth.registerUser(_emailController.text.trim(),_passwordController.text.trim());
                          }
                        },
                        color: indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(horizontal:30.0,vertical: 10.0),
                        child: Text(
                          'สมัครสมาชิกเลย',
                          style:
                            TextStyle(fontFamily: 'Prompt', fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                      ),

                    ],
                    ),
                      )
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