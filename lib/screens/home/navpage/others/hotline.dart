import 'package:flutter/material.dart';

class HotlinePage extends StatelessWidget {

  IconThemeData iconThemeData = IconThemeData(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: iconThemeData,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: new Text('Hotline', style: TextStyle(fontFamily: 'Anakotmai Medium',fontSize: 20, color: const Color.fromARGB(255, 40, 40, 40))),
        centerTitle: true,
      ),

      body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 150,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            DMHCard()
          ]
        )
      ),
    ),

    );
  }

}

class DMHCard extends  StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: const Color.fromARGB(255, 251, 215, 219), width: 3.0),
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
                Text('1323 โทรฟรีตลอด 24 ชั่วโมง', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Text('Inbox Facebook : เวลา 17.00 - 22.00 น.', style: TextStyle(fontFamily: 'prompt',fontSize: 16, color: Colors.grey[600])),
                Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: null, 
                      child: null)
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
      
    );
  }

}