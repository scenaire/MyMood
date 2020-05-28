import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Services/MoodCloudFirestore.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
      height: MediaQuery.of(context).size.height - 230,

      child: FutureBuilder(
          future: retriveData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: JumpingText("กำลังโหลด...")
                      );
                    } else if (snapshot.data.length == 0) {
                      return Center(
                        child: Text("อย่าลืมเพิ่มอารมณ์ของคุณนะ"),
                      );
                    }
                    else {
                      return SingleChildScrollView(
                        child: LineChartMood(moodList: snapshot.data,)
                      );
                    }
                  },
                ),
      
    );
  }
}

class LineChartMood extends StatefulWidget {

  final List<Mood> moodList;

  const LineChartMood({
    Key key,
    this.moodList
  }) : super(key: key);

  @override
  _LineChartMoodState createState() => _LineChartMoodState();
}

class _LineChartMoodState extends State<LineChartMood> {
  
  List<Color> gradientColors = [
    const Color(0xFFADD4D9),
    //const Color(0xFF85A2A6),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Padding(padding: EdgeInsets.only(top: 20.0)),

        Text('กราฟอารมณ์ของคุณ', style: TextStyle(color: Colors.teal, fontSize: 20),),

        Padding(padding: EdgeInsets.only(top: 20.0)),
        //Text('วันที่ บลาๆๆ', style: TextStyle(color: Colors.black),),

        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 0, bottom:12),
              child: LineChart(
                mainData(),
              ),
            ),
          )
        ),

      ],
    );
  }

  List<FlSpot> getSpots() {
    List<FlSpot> spots = new List<FlSpot>();

    for(int i=0; i<widget.moodList.length; i++) {

      switch(widget.moodList[i].getType) {
        case "Depress": spots.add(FlSpot(i.toDouble(),0.0)); break;
        case "Unhappy":  spots.add(FlSpot(i.toDouble(),1.0));;  break;
        case "Normal":  spots.add(FlSpot(i.toDouble(),2.0));;  break;
        case "Happy":  spots.add(FlSpot(i.toDouble(),3.0));;  break;
        case "Maniac":  spots.add(FlSpot(i.toDouble(),4.0));; break;
      }

    }

    return spots;

  }

  LineChartData mainData() {
    return LineChartData(

      gridData: FlGridData(
        show: false
      ),
      
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          textStyle:
              const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xFF85A2A6), width: 1)),
      minX: 0,
      maxX: widget.moodList.length.toDouble() - 1,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(),
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}