import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mymood/Models/Article.dart';

class EachArticle extends StatefulWidget {

  final Article article;

  EachArticle({Key key, this.article}) : super (key: key);

  @override
  _EachArticleState createState() => _EachArticleState();
}

class _EachArticleState extends State<EachArticle> {

  @override
  Widget build(BuildContext context) {

    var iconThemeData = IconThemeData(color: Theme.of(context).primaryColor);

    return Scaffold(
      appBar: AppBar(
        iconTheme: iconThemeData,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        // title: Text(
        //   "MOOD DAY",
        //   style: TextStyle(
        //       fontFamily: 'Anakotmai Medium',
        //       fontSize: 18,
        //       color: Colors.black),
        // ),
      ),

      body: Container(
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(widget.article.title, style: TextStyle(fontFamily: 'Prompt', fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Image.network(widget.article.picturePath),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Html(data: widget.article.content)
              ),

              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text("โดย : " + widget.article.credits)
              )


            ],
          ),
          )
      ),


    );
  }
}