import 'package:flutter/material.dart';

class SuicideDialog extends StatelessWidget {


  dialogContent(BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(
  padding: EdgeInsets.only(
    top: 66.6 + 16.0,
    bottom: 16.0,
    left: 16.0,
    right: 16.0,
  ),
  margin: EdgeInsets.only(top: 66.6),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        'เราอยากช่วยเหลือคุณ',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 16.0),
      Text(
        'เราตรวจพบข้อความที่เสี่ยงต่อการทำร้ายตัวเองของคุณ เราขอแนะนำให้คุณทำแบบประเมินหรือโทรปรึกษาศูนย์สุขภาพจิต',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      SizedBox(height: 24.0),
      Align(
        alignment: Alignment.bottomRight,
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop(); // To close the dialog
          },
          child: Text('ตกลง'),
        ),
      ),
    ],
  ),
),
      Positioned(
        left: 16.0,
        right: 16.0,
        child: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        radius: 66.6,
      ),
),
    ],
  );
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.transparent,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      )
    );
  }
}