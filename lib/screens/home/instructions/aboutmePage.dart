//AUTHOR : Jiratchaya Yeeto

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {

  var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));

  @override
  Widget build(BuildContext context) {

    return Scaffold(

       backgroundColor: Colors.white,

      //*********************Appbar */
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconThemeData,
        elevation: 0,
        title: Text(
          'เกี่ยวกับเรา',
          style: TextStyle(fontFamily: 'Anakotmai Medium', color: const Color.fromARGB(255, 40, 40, 40)),
        ),
        centerTitle: true,
      ),

      body: Container(

        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 40.0),

        child: SingleChildScrollView(
          child: Column (
            
            children: <Widget>[

              Padding(padding: EdgeInsets.only(top: 30)),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('คณะวิทยาศาสตร์และเทคโนโลยี', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 16, color: Colors.black), textAlign: TextAlign.start,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('สาขาวิทยาการคอมพิวเตอร์', style: TextStyle(fontFamily: 'anakotmai medium', fontSize: 16, color: Colors.black), textAlign: TextAlign.start,),
              ),
              

              Padding(padding: EdgeInsets.only(top: 30)),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("เวอร์ชัน 1 : แอปพลิเคชัน Thai's Mood", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("นายเจริญ ลิ้มศักดิ์ขจร", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("นายปวัณ ปั้นพินิจ", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:  Text("อาจารย์ที่ปรึกษา : ดร. มนวรรัตน์ ผ่องไพบูลย์", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("ปีการศึกษา 2561", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),


              Padding(padding: EdgeInsets.only(top: 30)),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("เวอร์ชัน 2 : แอปพลิเคชัน My mood day", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("นางสาวจิรัชญา ยี่โต๊ะ", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("นางสาวรัชนี ใจโน", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("อาจารย์ที่ปรึกษา : ดร. มนวรรัตน์ ผ่องไพบูลย์", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("ปีการศึกษา 2562", style: TextStyle(fontFamily: 'prompt', fontSize: 14, color: Colors.grey[600]), textAlign: TextAlign.left,),
              ),


            ],)

          ),
      )

    );
  }
}