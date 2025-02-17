import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/t_meal.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/eat_cell.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/meals/meal_detail.dart';

class PlanV extends StatefulWidget {
  const PlanV({super.key});

  @override
  State<PlanV> createState() => _PlanVState();
}

class _PlanVState extends State<PlanV> {
  List planmArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/nigiri 1.png",
      "time": "Today 08:00 AM",
    },
    {
      "name": "Lowfat Milk",
      "image": "assets/img/glass-of-milk 1.png",
      "time": "Today 09:00 AM"
    },
  ];
  List fplanmArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/cheeryb.png",
      "number": "120+ Food",
    },
    {"name": "Lunch", "image": "assets/img/yogurt.png", "number": "130+ Food"},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
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
          "Meal Planner",
          style: TextStyle(
            color: TableColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: TableColor.lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.more_vert_outlined),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 204, 231),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: media.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Workout Progress!",
                        style: TextStyle(
                          color: TableColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: TableColor.secondry,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: ["Weekly", "Monthly"]
                                .map((name) => DropdownMenuItem(
                                      value: name,
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          color: TableColor.gray,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {},
                            icon: Icon(
                              Icons.expand_more,
                              color: TableColor.white,
                            ),
                            hint: Text(
                              "Weekly",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: TableColor.gray,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              height: media.width * 0.5,
              width: double.maxFinite,
              child: LineChart(
                LineChartData(
                  // showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                  //   return ShowingTooltipIndicators([
                  //     LineBarSpot(
                  //       tooltipOnBar,
                  //       lineBarsData.indexOf(tooltipOnBar),
                  //       tooltipOnBar.spots[index],
                  //     ),
                  //   ]);
                  // }).toList(),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchCallback:
                        (FlTouchEvent event, LineTouchResponse? response) {
                      // if (response == null || response.lineBarSpots == null) {
                      //   return;
                      // }
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
            SizedBox(
              height: media.width * 0.05,
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
                    "Daily Meal Schedule!",
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ActivityT(),
                        //   ),
                        // );
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
                  "Todays Meal",
                  style: TextStyle(
                    color: TableColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: TableColor.secondry,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items:
                          ["Breakfast", "Lunch", "Dinner", "Snack", "Dessert"]
                              .map((name) => DropdownMenuItem(
                                    value: name,
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                        color: TableColor.gray,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ))
                              .toList(),
                      onChanged: (value) {},
                      icon: Icon(
                        Icons.expand_more,
                        color: TableColor.white,
                      ),
                      hint: Text(
                        "Breakfast",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TableColor.gray,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: planmArr.length,
                itemBuilder: (context, index) {
                  var mObj = planmArr[index] as Map? ?? {};
                  return TodMeal(mObj: mObj);
                }),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find Something For Eat.",
                    style: TextStyle(
                      color: TableColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.6,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fplanmArr.length,
                  itemBuilder: (context, index) {
                    var fObj = fplanmArr[index] as Map? ?? {};
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MealDetail(eObj: fObj),),);
                        },
                        child: EatCell(fObj: fObj, index: index));
                  }),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
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
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 3,
            color: Colors.white,
            strokeWidth: 1,
            strokeColor: TableColor.primaryColor3,
          ),
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
