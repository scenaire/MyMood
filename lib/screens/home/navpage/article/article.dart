import 'package:flutter/material.dart';
import 'package:mymood/Models/Article.dart';
import 'package:mymood/Screens/Home/navpage/article/eachArticle.dart';
import 'package:mymood/Services/ArticleCloudFirestore.dart';
import 'package:progress_indicators/progress_indicators.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  Future<List<Article>> articleData;

  @override
  void initState() {
    super.initState();
    articleData = retriveData();
  }


  Widget getArticleCardWidget (List<Article> aList) {
    List<Widget> list = new List<Widget>();

    int end = aList.length;

    
    for(var i = 0; i < end; i++) {

      list.add(
        new ArticleCard(
          article: aList[i],
        )
      );
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list
    );
  }

  Future<List<Article>> retriveData() async {
    ArticleCloudFirestore ac = ArticleCloudFirestore();
    return await ac.retriveArticleData();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEFEFE),
      //margin: EdgeInsets.symmetric(horizontal: 15.0),
      child:  new SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  //ฺ**************************** BANNER **************//
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 200,
                  //   margin: new EdgeInsets.only(bottom: 20.0),
                  //   child: Center(
                  //     child: Text("เว้นที่ไว้ใส่ภาพ")
                  //   ),
                  //   decoration: new BoxDecoration(
                  //     color: Colors.amber,
                      
                  //   ),
                  // ),
                  
                  Container(
                    child: FutureBuilder(
                      future: articleData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Center(  
                            child: Container(
                              height: MediaQuery.of(context).size.height - 170,
                              child: JumpingText('กำลังโหลด...'),
                            ),

                          );
                        } else if (snapshot.data.length == 0) {
                          return Center (child: Text("ไม่มีบทความในขณะนี้"),);
                        } else {
                          return getArticleCardWidget(snapshot.data);
                        }
                      }
                    ),
                  )

                  //ฺ**************************** Article Field **************//

                  // Container(
                  //   margin: new EdgeInsets.only(
                  //     top: 15.0,
                  //     left: 10.0,
                  //     bottom: 20.0
                  //   ),
                  //   child: 
                  //   Text( 
                  //     'บทความ',
                  //     style:
                  //       TextStyle(fontFamily: 'Prompt', fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                  //   ),
                  // ),

                    

                ],
              )
            ),
    );
  }
}

class ArticleCard extends StatelessWidget {

  final Article article;

  const ArticleCard({
    Key key,
    this.article
  }) : super(key: key);


  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => EachArticle(article: article)));},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(article.picturePath, height: 150, fit: BoxFit.fill,),
              ),
              ListTile(
                title: Text(article.title,
                style: TextStyle(fontFamily: 'Prompt', fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)),
                subtitle: Text("โดย : "+article.credits),
              ),
            ],
          ),
        ),
      ),
    );
  }



  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 10, left: 10),
  //     child: SizedBox(
  //       height: 156,
  //       child: Stack(
  //         alignment: Alignment.centerLeft,
  //         children: <Widget>[
  //           Container(
  //             height: 136,
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.white,
  //               boxShadow: [
  //                 BoxShadow(
  //                   offset: Offset(0,8),
  //                   blurRadius: 24,
  //                   color: Color(0xFFB7B7B7).withOpacity(.16)
  //                 ),
  //               ],
  //             ),
  //           ),

  //           Image.network(article.picturePath),

  //           Positioned(
  //             left: 130,
  //             child: Container (
  //               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //               height: 136,
  //               width: MediaQuery.of(context).size.width - 170,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: <Widget>[
  //                   Text(
  //                     article.getTitle,
  //                     style: TextStyle(fontFamily: 'Prompt', fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
  //                   ),

  //                   Expanded(
  //                     child: Text(
  //                       "โดย : " + article.getCredits,
  //                       maxLines: 4,
  //                       overflow: TextOverflow.ellipsis,
  //                       style: TextStyle(fontFamily: 'Prompt', fontSize: 12, color: Colors.grey),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )
  //           )



  //         ]
  //       )
  //     ),
  //   );
  // }

}