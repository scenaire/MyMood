import 'package:flutter/material.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Home/MyHomePage.dart';
import 'package:mymood/Screens/Home/navpage/others/hotline.dart';
import 'package:mymood/Screens/Home/quizpage/EightQPage.dart';
import 'package:mymood/Screens/Home/quizpage/MDQPage.dart';
import 'package:mymood/Screens/Home/quizpage/NineQPage.dart';

class QuizResult extends StatelessWidget {


  final User user;
  final int result;
  final int quiz;
  final bool isBipolar;

  static const String depressPic = 'assets/pictures/cDepress.png';
  static const String happyPic = 'assets/pictures/cHappy.png';
  static const String maniacPic = 'assets/pictures/cManiac.png';

  QuizResult({Key key, this.user, this.result, this.quiz, this.isBipolar}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    List<Widget> mdQResult() {
      List<Widget> list = List<Widget>();

      if (!isBipolar) {
        list.add(new Text('คุณไม่มีความเสี่ยงเป็นโรคไบโพลาร์', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      list.add(new Text('โดยมีคะแนน $result คะแนน'));
      list.add(new Container(child: Image.asset(happyPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Padding(padding: EdgeInsets.only(top: 50)));
      list.add(new ButtonTheme(
        minWidth: 150,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.yellow[400],
          elevation: 0.0,
          child: Text('กลับหน้าหลัก', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user)));
          }
        ),));
      } else {
          list.add(new Text('คุณมีความเสี่ยงเป็นโรคไบโพลาร์', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      list.add(new Container(child: Image.asset(depressPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Text('เราอยากช่วยเหลือคุณ'));
      list.add(new Text('เราขอแนะนำให้คุณพบแพทย์ หรือ'));
      list.add(new Text('ใช้บริการฮอตไลน์'));
      list.add(new Padding(padding: EdgeInsets.only(top: 20)));
      list.add(new ButtonTheme(
        minWidth: 170,
        height: 40,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.deepPurple[200],
          elevation: 0.0,
          child: Text('ค้นหาคลินิกใกล้เคียง', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user, currentPage: 0,)));
          }
        ),));
      list.add(Padding(padding: EdgeInsets.symmetric(vertical: 2),));
      list.add(new ButtonTheme(
        minWidth: 170,
        height: 40,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.deepPurple[200],
          elevation: 0.0,
          child: Text('ฮอตไลน์สุขภาพจิต', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HotlinePage()));
          }
        ),));
      list.add(Padding(padding: EdgeInsets.symmetric(vertical: 2),));
      list.add(new ButtonTheme(
        minWidth: 170,
        height: 40,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.black,
          elevation: 0.0,
          child: Text('กลับหน้าหลัก', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user,)));
          }
        ),));
      }
      return list;
    }


    List<Widget> twoQResult() {
      List<Widget> list = List<Widget>();

    if (result > 0) {
      list.add(new Text('คุณมีแนวโน้มเป็นโรคซึมเศร้า', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      list.add(new Text('โดยมีคะแนน $result คะแนน'));
      list.add(new Container(child: Image.asset(depressPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Text('ไม่ต้องกังวล นี่เป็นเพียงการคัดกรองเบื้องต้นเท่านั้น'));
      list.add(new Text('เราขอรบกวนคุณทำแบบประเมิน 9Q'));
      list.add(new Text('เพื่อการประเมินที่แม่นยำยิ่งขึ้น'));
      list.add(new Padding(padding: EdgeInsets.only(top: 50)));
      list.add(new ButtonTheme(
        minWidth: 150,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.deepPurple[200],
          elevation: 0.0,
          child: Text('ทำแบบประเมิน', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NineQPage(user: user)));
          }
        ),));
    } else {
      list.add(new Text('คุณไม่มีแนวโน้มเป็นโรคซึมเศร้า', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      list.add(new Container(child: Image.asset(happyPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Text('อย่างไรก็ตาม'));
      list.add(new Text('คุณสามารถกลับมาทำแบบประเมินได้ทุกเมื่อ'));
      list.add(new Padding(padding: EdgeInsets.only(top: 30)));
      list.add(Text('ทำแบบประเมิน MDQ'));
      list.add(Text('เพื่อคัดกรองความเสี่ยงโรคไบโพลาร์'));
      list.add(new Padding(padding: EdgeInsets.only(top: 10)));
      list.add(new ButtonTheme(
        minWidth: 200,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.yellow[400],
          elevation: 0.0,
          child: Text('แบบประเมิน MDQ', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MDQPage(user: user)));
          }
        ),));
        list.add(new Padding(padding: EdgeInsets.only(top: 20)));
      list.add(new ButtonTheme(
        minWidth: 200,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.black,
          elevation: 0.0,
          child: Text('กลับหน้าหลัก', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.yellow)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user)));
          }
        ),));
    }

    return list;
  }

  List<Widget> nineQResult() {
    List<Widget> list = List<Widget>();

    if (result < 7) {
      list.add(new Text('คุณไม่มีอาการของโรคซึมเศร้า', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      list.add(new Text('หรือมีอาการน้อยมาก', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      list.add(new Text('โดยมีคะแนน $result คะแนน'));
      list.add(new Container(child: Image.asset(happyPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Text('อย่างไรก็ตาม'));
      list.add(new Text('คุณสามารถกลับมาทำแบบประเมินได้ทุกเมื่อ'));
      list.add(new Padding(padding: EdgeInsets.only(top: 30)));
      list.add(Text('ทำแบบประเมิน MDQ'));
      list.add(Text('เพื่อคัดกรองความเสี่ยงโรคไบโพลาร์'));
      list.add(new Padding(padding: EdgeInsets.only(top: 10)));
      list.add(new ButtonTheme(
        minWidth: 200,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.yellow[400],
          elevation: 0.0,
          child: Text('แบบประเมิน MDQ', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MDQPage(user: user)));
          }
        ),));
        list.add(new Padding(padding: EdgeInsets.only(top: 20)));
      list.add(new ButtonTheme(
        minWidth: 200,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.black,
          elevation: 0.0,
          child: Text('กลับหน้าหลัก', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.yellow)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user)));
          }
        ),));
    } else {
      if (result >= 7 && result < 13) {
        list.add(new Text('คุณมีอาการของโรคซึมเศร้าระดับน้อย', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      } else if (result >= 13 && result < 19) {
        list.add(new Text('คุณมีอาการของโรคซึมเศร้าระดับปานกลาง', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      } else if (result >= 19) {
        list.add(new Text('คุณมีอาการของโรคซึมเศร้าระดับรุนแรง', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      }
      list.add(new Text('โดยมีคะแนน $result คะแนน'));
      list.add(new Container(child: Image.asset(depressPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Text('เราขอรบกวนคุณทำแบบประเมิน 8Q'));
      list.add(new Text('เพื่อประเมินความเสี่ยงในการทำร้ายตนเอง'));
      list.add(new Padding(padding: EdgeInsets.only(top: 50)));
      list.add(new ButtonTheme(
        minWidth: 150,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.deepPurple[200],
          elevation: 0.0,
          child: Text('ทำแบบประเมิน', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EightQPage(user: user)));
          }
        ),));
    }

    return list;
  }

  List<Widget> eightQResult() {
    List<Widget> list = List<Widget>();

    if (result == 0) {
      list.add(new Text('คุณไม่มีคุณมีแนวโน้มที่จะฆ่าตัวตายในปัจจุบัน', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      list.add(new Text('โดยมีคะแนน $result คะแนน'));
      list.add(new Container(child: Image.asset(happyPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Text('อย่างไรก็ตาม'));
      list.add(new Text('คุณสามารถกลับมาทำแบบประเมินได้ทุกเมื่อ'));
      list.add(new Padding(padding: EdgeInsets.only(top: 30)));
      list.add(Text('ทำแบบประเมิน MDQ'));
      list.add(Text('เพื่อคัดกรองความเสี่ยงโรคไบโพลาร์'));
      list.add(new Padding(padding: EdgeInsets.only(top: 10)));
      list.add(new ButtonTheme(
        minWidth: 200,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.yellow[400],
          elevation: 0.0,
          child: Text('แบบประเมิน MDQ', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MDQPage(user: user)));
          }
        ),));
        list.add(new Padding(padding: EdgeInsets.only(top: 20)));
      list.add(new ButtonTheme(
        minWidth: 200,
        height: 50,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.black,
          elevation: 0.0,
          child: Text('กลับหน้าหลัก', style: TextStyle(fontFamily: 'prompt',fontSize: 20, color: Colors.yellow)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user)));
          }
        ),));
    } else {
      if (result >= 1 && result < 9) {
        list.add(new Text('คุณมีแนวโน้มที่จะฆ่าตัวตายในปัจจุบัน', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
        list.add(new Text('ระดับน้อย', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      } else if (result >= 9 && result < 17) {
        list.add(new Text('คุณมีแนวโน้มที่จะฆ่าตัวตายในปัจจุบัน', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
        list.add(new Text('ระดับปานกลาง', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      } else if (result >= 17) {
        list.add(new Text('คุณมีแนวโน้มที่จะฆ่าตัวตายในปัจจุบัน', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
        list.add(new Text('ระดับรุนแรง', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))));
      }
      list.add(new Text('โดยมีคะแนน $result คะแนน'));
      list.add(new Container(child: Image.asset(depressPic), margin: EdgeInsets.symmetric(vertical: 20.0)));
      list.add(new Text('เราอยากช่วยเหลือคุณ'));
      list.add(new Text('เราขอแนะนำให้คุณพบแพทย์ หรือ'));
      list.add(new Text('ใช้บริการฮอตไลน์สำหรับผู้ป่วยซึมเศร้า'));
      list.add(new Padding(padding: EdgeInsets.only(top: 20)));
      list.add(new ButtonTheme(
        minWidth: 170,
        height: 40,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.deepPurple[200],
          elevation: 0.0,
          child: Text('ค้นหาคลินิกใกล้เคียง', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user, currentPage: 0,)));
          }
        ),));
      list.add(Padding(padding: EdgeInsets.symmetric(vertical: 2),));
      list.add(new ButtonTheme(
        minWidth: 170,
        height: 40,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.deepPurple[200],
          elevation: 0.0,
          child: Text('ฮอตไลน์สุขภาพจิต', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HotlinePage()));
          }
        ),));
      list.add(Padding(padding: EdgeInsets.symmetric(vertical: 2),));
      list.add(new ButtonTheme(
        minWidth: 170,
        height: 40,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
          color: Colors.black,
          elevation: 0.0,
          child: Text('กลับหน้าหลัก', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(user: user,)));
          }
        ),));
      
    }

    return list;
  }

  List<Widget> getBody() {

    List<Widget> list = List<Widget>();

    if (quiz == 2) {
      list = list+twoQResult();
    } else if (quiz == 9) {
      list = list+ nineQResult();
    } else if (quiz == 8) {
      list = list + eightQResult();
    } else if (quiz == 0) {
      list = list + mdQResult();
    }

    return list;
  }




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: new Text('ผลคะแนนของการทำแบบประเมิน', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
        centerTitle: true,
      ),

      body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 150,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  getBody()
        )
      ),
    ),

    );
  }
}