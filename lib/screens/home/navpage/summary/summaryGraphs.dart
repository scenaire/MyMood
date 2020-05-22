import 'package:flutter/material.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Services/MoodCloudFirestore.dart';

class SummaryGraphs extends StatelessWidget {

  final User user;

  SummaryGraphs({Key key, this.user}) : super(key: key);

  Future<List<Mood>> retriveData() async {
      MoodCloudFirestore mc = MoodCloudFirestore(uid: user.uid);
      return await mc.retriveMoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 130,

      child: Column(

        children: <Widget>[

          

        ],

      ),
      
    );
  }
}