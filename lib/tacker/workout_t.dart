import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/dow.dart';
import 'package:grow_up/c_widgets/up_coming.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/home/activity_t.dart';
import 'package:grow_up/tacker/detail.dart';

class WorkoutT extends StatefulWidget {
  const WorkoutT({super.key});

  @override
  State<WorkoutT> createState() => _WorkoutTState();
}

class _WorkoutTState extends State<WorkoutT> {
  List latestyArr = [
    {
      "image": "assets/img/up1.png",
      "title": "Fullbody Workout",
      "time": "Today, 03:00pm"
    },
    {
      "image": "assets/img/up2.png",
      "title": "Upperbody Workout",
      "time": "June 05, 02:00pm"
    },
  ];
  List whatArr = [
    {
      "image": "assets/img/up1.png",
      "title": "Fullbody Workout",
      "time": "11 Exercises | 32mins"
    },
    {
      "image": "assets/img/do2.png",
      "title": "Lowebody Workout",
      "time": "12 Exercises | 40mins"
    },
    {
      "image": "assets/img/do3.png",
      "title": "AB Workout",
      "time": "14 Exercises | 20mins"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: TableColor.third,
      )),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // pinned: true,
              backgroundColor:
                  Colors.transparent, // Colors.purple.withOpacity(0.1),
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: TableColor.lightGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),

              title: Text(
                "Workout Tracker",
                style: TextStyle(
                  color: TableColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TableColor.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.menu)),
                ),
              ],
            ),
            SliverAppBar(
              backgroundColor:
                  Colors.transparent, // Colors.purple.withOpacity(0.1),
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              expandedHeight: media.width * 0.5,
              flexibleSpace: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: media.width * 0.5,
                width: double.maxFinite,
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(
                      enabled: true,
                      handleBuiltInTouches: false,
                      touchCallback:
                          (FlTouchEvent event, LineTouchResponse? response) {
                        if (response == null || response.lineBarSpots == null) {
                          return;
                        }

                        // if (event is FlTapUpEvent) {
                        //   final spotIndex =
                        //       response.lineBarSpots!.first.spotIndex;
                        //   showingTooltipOnSpots.clear();
                        //   setState(() {
                        //     showingTooltipOnSpots.add(spotIndex);
                        //   });
                        // }
                      },
                      mouseCursorResolver:
                          (FlTouchEvent event, LineTouchResponse? response) {
                        if (response == null || response.lineBarSpots == null) {
                          return SystemMouseCursors.basic;
                        }
                        return SystemMouseCursors.click;
                      },
                      getTouchedSpotIndicator:
                          (LineChartBarData barData, List<int> spotIndex) {
                        return spotIndex.map((index) {
                          return TouchedSpotIndicatorData(
                            const FlLine(color: Colors.transparent),
                            FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, barData, index) =>
                                  FlDotCirclePainter(
                                radius: 3,
                                color: Colors.white,
                                strokeColor: TableColor.primaryColor3,
                                strokeWidth: 3,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      touchTooltipData: LineTouchTooltipData(
                        // tooltipBgColor: TableColor.primaryColor3,
                        tooltipRoundedRadius: 20,
                        getTooltipItems: (List<LineBarSpot> lineBarSpot) {
                          return lineBarSpot.map((lineBarSpot) {
                            return LineTooltipItem(
                              "${lineBarSpot.x.toInt()} mis ago",
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    lineBarsData: lineBarData1,
                    minY: -0.5,
                    maxY: 100,
                    // maxX: 7,
                    titlesData: FlTitlesData(
                        show: true,
                        leftTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: bottomTitles,
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: rightTitles,
                        )),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: true,
                      horizontalInterval: 20,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: TableColor.lightGrey.withOpacity(0.25),
                          strokeWidth: 2,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: Colors.transparent,
                        )),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 84, 169).withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: TableColor
                          .lightGrey //const Color.fromARGB(255, 238, 84, 169)
                      // .withOpacity(0.3),
                      ,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: TableColor.primaryColor2.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Workout Schedule!",
                          style: TextStyle(
                            color: TableColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          width: 70,
                          child: RButton(
                            title: "Go!",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            type: RButtonType.bgGradient,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ActivityT(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Workout",
                        style: TextStyle(
                          color: TableColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See More!",
                          style: TextStyle(
                            color: TableColor.gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: latestyArr.length,
                      itemBuilder: (context, index) {
                        var wObj = latestyArr[index] as Map? ?? {};
                        return UpComimg(wObj: wObj);
                      }),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "What do you want to train",
                        style: TextStyle(
                          color: TableColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: whatArr.length,
                      itemBuilder: (context, index) {
                        var wObj = whatArr[index] as Map? ?? {};
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WDetail(dObj: wObj),
                                ),
                              );
                            },
                            child: DoWork(wObj: wObj));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  LineTouchData get lineTouchData1 => const LineTouchData(
        handleBuiltInTouches: false,
        touchTooltipData: LineTouchTooltipData(
            // Color Function(LineBarSpot) getTooltipColor: Colors.white,
            ),
      );
  List<LineChartBarData> get lineBarData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 4,
        gradient: LinearGradient(
          colors: [
            TableColor.primaryColor2.withOpacity(0.5),
            TableColor.primaryColor2.withOpacity(0.5),
          ],
        ),
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );
  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 4,
        gradient: LinearGradient(
          colors: [
            TableColor.primaryColor3.withOpacity(0.5),
            TableColor.primaryColor3.withOpacity(0.5),
          ],
        ),
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
        ],
      );
  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitlesWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );
  Widget rightTitlesWidgets(
    double value,
    TitleMeta meta,
  ) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = "0%";
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }
    return Text(
      text,
      style: TextStyle(
        color: TableColor.gray,
        fontSize: 12,
      ),
      textAlign: TextAlign.center,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(
    double value,
    TitleMeta meta,
  ) {
    var style = TextStyle(
      color: TableColor.gray,
      fontSize: 12,
    );

    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text(
          'Sun',
          style: style,
        );
        break;
      case 2:
        text = Text(
          'Mon',
          style: style,
        );
        break;
      case 3:
        text = Text(
          'Tue',
          style: style,
        );
        break;
      case 4:
        text = Text(
          'Wed',
          style: style,
        );
        break;
      case 5:
        text = Text(
          'Thu',
          style: style,
        );
        break;
      case 6:
        text = Text(
          'Fry',
          style: style,
        );
        break;
      case 7:
        text = Text(
          'Sat ',
          style: style,
        );
        break;
      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
