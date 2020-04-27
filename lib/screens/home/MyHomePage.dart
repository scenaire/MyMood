import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Screens/Authenticate/Firstpage.dart';
import 'package:mymood/Services/Auth.dart';
import 'package:mymood/screens/home/my_mood_icon_icons.dart';

import 'navpage/article/article.dart';
import 'navpage/homepage/homescreen.dart';
import 'navpage/moodpage/moodHome.dart';
import 'navpage/sleeppage/sleep.dart';
import 'navpage/summary/summary.dart';




class MyHomePage extends StatefulWidget {
  
  
  final User user;

  MyHomePage({Key key, this.user}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _auth = AuthService();
  int currentIndex;
  

  

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  //change page function
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    //page setup
  final pageOptions = [
    HomeScreen(user: widget.user,),
    SummaryPage(),
    SleepPage(),
    ArticlePage(),
  ];
    


    var iconThemeData = IconThemeData(color: const Color.fromARGB(255, 40, 40, 40));

    return Scaffold(
      backgroundColor: Colors.white,

      //*********************Appbar */
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: iconThemeData,
        elevation: 0,
        title: Text(
          'MOOD DAY',
          style: TextStyle(fontFamily: 'Anakotmai Medium', color: const Color.fromARGB(255, 40, 40, 40)),
        ),
        centerTitle: true,
      ),

      //*********************Sliding Menu */
      drawer: ClipRRect(
        borderRadius: BorderRadius.circular(23.0),
        child: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
              child: Text(
                      "สาลี่",
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 25, color: Colors.grey[800], fontWeight: FontWeight.w600),
                    ),
            ),
            ListTile(
              title: Text(
                      "จัดการโปรไฟล์",
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w600),
                    ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                      "ทำแบบประเมินสุขภาพจิต",
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w600),
                    ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                      "ประวัติการทำแบบประเมินสุขภาพจิต",
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w600),
                    ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                      "ค้นหาคลีนิคสุขภาพจิตใกล้คุณ",
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 16, color: Colors.grey[800], fontWeight: FontWeight.w600),
                    ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                      "ออกจากระบบ",
                      style: TextStyle(fontFamily: 'Prompt', fontSize: 16, color: Colors.red, fontWeight: FontWeight.w600),
                    ),
              onTap: () async {
                await _auth.signOut();
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstPage()));
                
              },
            )
          ]),
        ),
      ),

      //*********************Body */
      body: pageOptions[currentIndex],

      //*********************Bubble Navigator Bar */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MoodHome(user: widget.user,)));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("หน้าแรก", style: TextStyle(fontFamily: 'prompt'))),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.dashboard,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("สรุปผล", style: TextStyle(fontFamily: 'prompt'))),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                MyMoodIcon.moon,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                MyMoodIcon.moon,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("การนอน", style: TextStyle(fontFamily: 'prompt'))),
          BubbleBottomBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.book,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.book,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("บทความ", style: TextStyle(fontFamily: 'prompt')))
        ],
      ),
    );
  }
}