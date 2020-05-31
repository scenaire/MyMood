import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mymood/Models/Mood.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Services/MoodCloudFirestore.dart';
import 'package:mymood/Services/thCalendar.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SummaryGraphs extends StatelessWidget {

  final User user;

  SummaryGraphs({Key key, this.user}) : super(key: key);

  Future<List<Mood>> retriveData() async {
      MoodCloudFirestore mc = MoodCloudFirestore(uid: user.uid);
      return await mc.retriveMoodDataFB();
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
  
  // List<Color> gradientColors = [
  //   const Color(0xFFADD4D9),
  //   const Color(0xFF85A2A6),
  //   const Color(0xFFf5d791),
  //   const Color(0xFFF29580),
  //   const Color(0xFFF2695C),
  // ];

  @override
  Widget build(BuildContext context) {

    THCalendar cal = new THCalendar();

    String startDate = cal.changetoThaiDateSmall(widget.moodList[0].time);
    String endDate = cal.changetoThaiDateSmall(widget.moodList[widget.moodList.length - 1].time);

    return Column(
      children: <Widget>[

        Padding(padding: EdgeInsets.only(top: 20.0)),

        Text('กราฟอารมณ์ของคุณ', style: TextStyle(color: Colors.teal, fontSize: 18, fontFamily: 'anakotmai medium'),),
        Text('วันที่ $startDate ถึง $endDate ', style: TextStyle(color: Colors.grey, fontSize: 16),),

        Padding(padding: EdgeInsets.only(top: 10.0)),
        //Text('วันที่ บลาๆๆ', style: TextStyle(color: Colors.black),),

        AspectRatio(
          aspectRatio: 2.0,
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


        Padding(padding: EdgeInsets.only(top: 20)),

        Text('จำนวนอารมณ์ของคุณ', style: TextStyle(color: Colors.teal, fontSize: 18, fontFamily: 'anakotmai medium'),),

        Padding(padding: EdgeInsets.only(top: 10)),

        


      ],
    );
  }

  List<FlSpot> getSpots() {

    List<FlSpot> spots = new List<FlSpot>();

    double x = 0.0;

    for (Mood m in widget.moodList) {
      switch (m.type) {
        case "Depress" : spots.add(FlSpot(x,0.0)); break;
        case "Unhappy" : spots.add(FlSpot(x,1.0)); break;
        case "Normal" : spots.add(FlSpot(x,2.0)); break;
        case "Happy" : spots.add(FlSpot(x,3.0)); break;
        case "Maniac" : spots.add(FlSpot(x,4.0)); break;
      }
      x++;
    }

    return spots;

  }

  LineChartData mainData() {
    return LineChartData(

      gridData: FlGridData(
        show: false,
        drawHorizontalLine: false,
        drawVerticalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xFF85A2A6),
            strokeWidth: 1,
          );
        }
      ),
      
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: false,
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),


      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
                          final flSpot = barSpot;
                          String msg = '';

                          switch ((flSpot.y).floor()){
                            case 1 :  msg = "รู้สึกแย่";  break;
                            case 2 :  msg = "ปกติ";  break;
                            case 3 :  msg = "รู้สึกดี";  break;
                            case 4 :  msg = "มีความสุขมาก"; break;
                            default : msg = "เศร้ามาก"; break;
                          }

                          THCalendar cal = new THCalendar();

                          String date = cal.changetoThaiDateSmall(widget.moodList[(flSpot.x).floor()].time);
                          
                          return LineTooltipItem(
                            '$msg \n $date',
                            const TextStyle(color: Colors.teal, fontFamily: 'anakotmai medium'),
                          );
                        }).toList();
                      }
        ),
      ),



      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xFF85A2A6), width: 1)),
      minX: 0,
      maxX: widget.moodList.length.toDouble() - 1,
      minY: -1,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(),
          isCurved: true,
          colors: [
              const Color(0xFFF2695C).withOpacity(0.6),
              const Color(0xFFADD4D9).withOpacity(0.6),
          ],
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: [
              const Color(0xFFF2695C).withOpacity(0.3),
              const Color(0xFFADD4D9).withOpacity(0.3),
            ],
            gradientColorStops: [0.3, 1.0],
            gradientFrom: const Offset(0,0),
            gradientTo: const Offset(0, 1),
            spotsLine: BarAreaSpotsLine(
              show: true,
              flLineStyle: FlLine(
                color: const Color(0xFFADD4D9),
                strokeWidth: 2,
              )
            ),
            
          ),
        ),
        
      ],
    );
  }
}