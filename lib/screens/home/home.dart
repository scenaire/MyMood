import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:mymood/screens/authenticate/first_page.dart';
import 'package:mymood/screens/home/my_mood_icon_icons.dart';
import 'package:mymood/screens/home/navpage/moodPage/moodHome.dart';

import 'navpage/article/article.dart';
import 'navpage/homepage/homescreen.dart';
import 'navpage/sleeppage/sleep.dart';
import 'navpage/summary/summary.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;

  //page setup
  final _pageOptions = [
    HomeScreen(),
    SummaryPage(),
    SleepPage(),
    ArticlePage(),
  ];

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
    var iconThemeData = IconThemeData(color: Colors.white);

    return Scaffold(

      backgroundColor: Colors.white,

      //*********************Appbar */
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: iconThemeData,
        elevation: 0,
        title: Text('MOOD DAY', style: TextStyle(fontFamily: 'Anakotmai Medium'),),
        centerTitle: true,
        
      ),

      //*********************Sliding Menu */
      drawer: ClipRRect(
        borderRadius: BorderRadius.circular(23.0),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
              DrawerHeader(
                child: Text('สาลี่'),
              ),
              ListTile(
                title: Text('จัดการโปรไฟล์'),
                onTap: () {  },
              ),
              ListTile(
                title: Text('ออกจากระบบ'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FirstPage()));
                },
              )
            ]
          ),
        ),
      ),

      //*********************Body */
      body: _pageOptions[currentIndex],


      //*********************Bubble Navigator Bar */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MoodHome()));
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Theme.of(context).accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)),
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
              title: Text("หน้าแรก",style: TextStyle(fontFamily: 'prompt'))),
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
              title: Text("สรุปผล",style: TextStyle(fontFamily: 'prompt'))),
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
              title: Text("การนอน",style: TextStyle(fontFamily: 'prompt'))),
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
              title: Text("บทความ",style: TextStyle(fontFamily: 'prompt')))
        ],
      ),
    );
  }
}