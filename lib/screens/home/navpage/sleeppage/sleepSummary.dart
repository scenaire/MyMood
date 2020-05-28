import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mymood/Models/Sleep.dart';
import 'package:mymood/Models/User.dart';
import 'package:mymood/Services/SleepCloudFireStore.dart';
import 'package:mymood/Services/thCalendar.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SleepSummary extends StatefulWidget {

  final User user;

  SleepSummary({Key key, this.user}) : super(key: key);

  @override
  _SleepSummaryState createState() => _SleepSummaryState();
}

class _SleepSummaryState extends State<SleepSummary> {

  Future<List<Sleep>> retriveData() async {
      SleepCloudFireStore sc = SleepCloudFireStore(uid: widget.user.uid);
      return await sc.retriveSleepDataFB();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 275,

      child: FutureBuilder(
          future: retriveData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: JumpingText("กำลังโหลด...")
                      );
                    } else if (snapshot.data.length == 0) {
                      return Center(
                        child: Text("อย่าลืมเพิ่มการนอนของคุณนะ"),
                      );
                    }
                    else {
                      return SingleChildScrollView(
                        child: LineChartSleep(sleepList: snapshot.data,)
                      );
                    }
                  },
      ),
    );
  }
}

class LineChartSleep extends StatefulWidget {

  final List<Sleep> sleepList;

  const LineChartSleep({
    Key key,
    this.sleepList
  }) : super(key: key);

  @override
  _LineChartSleepState createState() => _LineChartSleepState();
}

class _LineChartSleepState extends State<LineChartSleep> {


  List<Color> gradientColors = [
    const Color(0xFFADD4D9),
    const Color(0xFF85A2A6),
    const Color(0xFFf5d791),
    const Color(0xFFF29580),
    const Color(0xFFF2695C),
  ];

  @override
  Widget build(BuildContext context) {

    THCalendar cal = new THCalendar();

    String startDate = cal.changetoThaiDateSmall(widget.sleepList[0].createDate);
    String endDate = cal.changetoThaiDateSmall(widget.sleepList[widget.sleepList.length - 1].createDate);

    
    return Container(

      color: Colors.white,
      width: MediaQuery.of(context).size.width,

      child: Column(
        children: <Widget> [

          Padding(padding: EdgeInsets.only(top: 20.0)),

        Text('กราฟการนอนของคุณ', style: TextStyle(color: Colors.teal, fontSize: 18, fontFamily: 'anakotmai medium'),),
        Text('วันที่ $startDate ถึง $endDate ', style: TextStyle(color: Colors.grey, fontSize: 16),),

        Padding(padding: EdgeInsets.only(top: 10.0)),

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

        Container(
          height: 240,
          color: Colors.white
        )

        ],
      ),
      
    );
  }

  List<FlSpot> getSpots() {

    List<FlSpot> spots = new List<FlSpot>();

    double x = 0.0;

    for (Sleep s in widget.sleepList) {
      spots.add(FlSpot(x,s.calculateSleepTimeMethod().toDouble()));
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
                          String msg = 'ชั่วโมงการนอน : ' + flSpot.y.floor().toString();

                          THCalendar cal = new THCalendar();

                          String date = cal.changetoThaiDateSmall(widget.sleepList[(flSpot.x).floor()].createDate);
                          
                          return LineTooltipItem(
                            '$msg \n $date',
                            const TextStyle(color: Colors.teal, fontFamily: 'anakotmai medium'),
                          );
                        }).toList();
                      }
        ),
      ),



      borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xFF85A2A6), width: 1)),
      minX: 0,
      maxX: widget.sleepList.length-1.toDouble(),
      minY: 1,
      maxY: 16,
      lineBarsData: [
        LineChartBarData(
          spots: getSpots(),
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
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