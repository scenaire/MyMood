import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    margin: new EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Text("เว้นที่ไว้ใส่ภาพ")
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.amber,
                      
                    ),
                  ),


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

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ArticleCard(
                          image: "assets/pictures/wear_mask.png",
                          title: "วิธีรับมือ ป้องกันโรคซึมเศร้า",
                          text: 
                          "เคยสังเกตไหม คนรอบข้างตัวคุณตอนนี้มีอย่างน้อย 1 คนที่กำลังป่วยเป็นโรคซึมเศร้า ในอดีตผู้คนอาจจะไม่ได้ใส่ใจโรคนี้มากเท่าไหร่ แต่จริงๆ แล้วภาวะซึมเศร้าใกล้ตัวกว่าที่คิด โดยเฉพาะสังคมเมือง",
                        ),

                        ArticleCard(
                          image: "assets/pictures/wear_mask.png",
                          title: "วิธีรับมือ ป้องกันโรคซึมเศร้า",
                          text: 
                          "เคยสังเกตไหม คนรอบข้างตัวคุณตอนนี้มีอย่างน้อย 1 คนที่กำลังป่วยเป็นโรคซึมเศร้า ในอดีตผู้คนอาจจะไม่ได้ใส่ใจโรคนี้มากเท่าไหร่ แต่จริงๆ แล้วภาวะซึมเศร้าใกล้ตัวกว่าที่คิด โดยเฉพาะสังคมเมือง",
                        ),

                        ArticleCard(
                          image: "assets/pictures/wear_mask.png",
                          title: "วิธีรับมือ ป้องกันโรคซึมเศร้า",
                          text: 
                          "เคยสังเกตไหม คนรอบข้างตัวคุณตอนนี้มีอย่างน้อย 1 คนที่กำลังป่วยเป็นโรคซึมเศร้า ในอดีตผู้คนอาจจะไม่ได้ใส่ใจโรคนี้มากเท่าไหร่ แต่จริงๆ แล้วภาวะซึมเศร้าใกล้ตัวกว่าที่คิด โดยเฉพาะสังคมเมือง",
                        ),

                        ArticleCard(
                          image: "assets/pictures/wear_mask.png",
                          title: "วิธีรับมือ ป้องกันโรคซึมเศร้า",
                          text: 
                          "เคยสังเกตไหม คนรอบข้างตัวคุณตอนนี้มีอย่างน้อย 1 คนที่กำลังป่วยเป็นโรคซึมเศร้า ในอดีตผู้คนอาจจะไม่ได้ใส่ใจโรคนี้มากเท่าไหร่ แต่จริงๆ แล้วภาวะซึมเศร้าใกล้ตัวกว่าที่คิด โดยเฉพาะสังคมเมือง",
                        ),
                      ]
                    ),

                ],
              )
            ),
    );
  }
}

class ArticleCard extends StatelessWidget {

  final String image;
  final String title;
  final String text;

  const ArticleCard({
    Key key,
    this.image,
    this.title,
    this.text
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,8),
                    blurRadius: 24,
                    color: Color(0xFFB7B7B7).withOpacity(.16)
                  ),
                ],
              ),
            ),

            Image.asset(image),

            Positioned(
              left: 130,
              child: Container (
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                    ),

                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: 'Prompt', fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              )
            )



          ]
        )
      ),
    );
  }

}