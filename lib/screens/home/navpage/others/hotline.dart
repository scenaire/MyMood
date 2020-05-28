import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlinePage extends StatelessWidget {

  IconThemeData iconThemeData = IconThemeData(color: Colors.black);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: iconThemeData,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: new Text('บริการที่ปรึกษาทางใจ', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
        centerTitle: true,
      ),

      body: Container(
      color: Color(0xFFF6F6F6),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 165,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/pictures/support.png'),
                fit: BoxFit.cover
              ),
                
              ),
              
            ),
            DMHCard(),
            SamaritansCard(),
            IStrongCard(),
            OocaCard(),
            CPFCard(),
          ]
        )
      ),
      )
    ),

    );
  }

}

class DMHCard extends  StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.all(0),
      height: MediaQuery.of(context).size.height * 0.30,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: const Color.fromARGB(255, 251, 215, 219), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        color: Colors.white,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text('สายด่วนสุขภาพจิต', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text('หน่วยงานให้คำปรึกษาจากกระทรวงสาธารณสุข', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('1323 โทรฟรีตลอด 24 ชั่วโมง', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('Inbox Facebook : เวลา 17.00 - 22.00 น.', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 120,
                      child: FlatButton(
                        color: Color(0xFFCAE7E7),
                        onPressed: () { launch("tel://1323"); }, 
                        child: Text('โทรเลย',style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 18, color: Colors.black)))
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    ButtonTheme(
                      minWidth: 120,
                      child: FlatButton(
                        color: Color(0xFFCAE7E7),
                        onPressed: () { launch("https://www.facebook.com/helpline1323"); }, 
                        child: Text('Chat bot',style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 18, color: Colors.black)))
                    ),
                  ],
                )
              ]
            ),
          ),
        )
      ),
    );
  }

}

class SamaritansCard extends  StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height * 0.30,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: const Color.fromARGB(255, 251, 215, 219), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        color: Colors.white,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text('สะมาริตันส์แห่งประเทศไทย', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text('สมาคมให้บริการเป็นเพื่อนคุยทางโทรศัพท์', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('เบอร์โทรกรุงเทพ : เวลา 12.00 - 22.00 น.', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('เบอร์โทรเชียงใหม่ : เวลา 19.00 - 22.00 น.', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 120,
                      child: FlatButton(
                        color: Color(0xFFCAE7E7),
                        onPressed: () { launch("tel://027136763"); }, 
                        child: Text('โทรเลย (กรุงเทพ)',style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 18, color: Colors.black)))
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    ButtonTheme(
                      minWidth: 120,
                      child: FlatButton(
                        color: Color(0xFFCAE7E7),
                        onPressed: () { launch("tel://053225977"); }, 
                        child: Text('โทรเลย (เชียงใหม่)',style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 18, color: Colors.black)))
                    ),
                  ],
                )
              ]
            ),
          ),
        )
      ),
    );
  }

}

class IStrongCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height * 0.30,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: const Color.fromARGB(255, 251, 215, 219), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        color: Colors.white,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text('iStrong', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text('เว็บไซต์ให้คำปรึกษาด้านสุขภาพจิตจากนักจิตวิทยาคลินิก', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),                
                Text('ค่าบริการ 1800 บาท / 60 นาที', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('เวลาให้บริการ : 8.00 - 18.00 น.', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 120,
                      child: FlatButton(
                        color: Color(0xFFCAE7E7),
                        onPressed: () { launch("https://www.istrong.co/"); }, 
                        child: Text('นัดหมายบริการ',style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 18, color: Colors.black)))
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}

class OocaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height * 0.30,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: const Color.fromARGB(255, 251, 215, 219), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        color: Colors.white,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text('OOCA', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text('แพลตฟอร์มปรึกษาจิตแพทย์ออนไลน์ผ่านวิดีโอคอล', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('ค่าบริการนักจิตวิทยา 1000 บาท / 30 นาที', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('ค่าบริการจิตแพทย์ 1500 / 30 นาที', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 120,
                      child: FlatButton(
                        color: Color(0xFFCAE7E7),
                        onPressed: () { launch("https://www.ooca.co/"); }, 
                        child: Text('เว็บไซต์',style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 18, color: Colors.black)))
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}

class CPFCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 8, right: 8),
      padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height * 0.30,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: const Color.fromARGB(255, 251, 215, 219), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        color: Colors.white,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget> [
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Text('Center for Psychological Wellness', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text('ศูนย์สุขภาวะทางจิตของคณะจิตวิทยา จุฬาลงกรณ์', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('นิสิตจุฬาลงกรณ์ใช้บริการฟรี', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('คนทั่วไปค่าบริการ 800 บาท / 60 - 90 นาที', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 120,
                      child: FlatButton(
                        color: Color(0xFFCAE7E7),
                        onPressed: () { launch("tel://022180336"); }, 
                        child: Text('โทรเลย',style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 18, color: Colors.black)))
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}