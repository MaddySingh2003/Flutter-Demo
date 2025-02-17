import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/common/workout.dart';
import 'package:grow_up/home/activity_t.dart';
import 'package:grow_up/home/note_fview.dart';
import 'package:grow_up/screens/home/boarding/workdone.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List lastWorkoutArr = [
    {
      "name": "Full body Workout",
      "image": "assets/img/lowerBody.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Upper body Workout",
      "image": "assets/img/upperbody.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Legs",
      "image": "assets/img/legs.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
  ];
  List<int> showingTooltipOnSpots = [1, 3, 5];
  List<FlSpot> get allSpots => const [
        FlSpot(0, 1),
        FlSpot(1, 2),
        FlSpot(2, 1.5),
        FlSpot(3, 3),
        FlSpot(4, 3.5),
        FlSpot(5, 5),
        FlSpot(6, 8),
      ];
  List waterArr = [
    {"title": "6am-8am", "subtitle": "400ml"},
    {"title": "9am-11am", "subtitle": "300ml"},
    {"title": "11am-2am", "subtitle": "900ml"},
    {"title": "2am-4am", "subtitle": "600ml"},
    {"title": "4am-8am", "subtitle": "800"},
    {"title": "9am-now", "subtitle": "700ml"}
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 2,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              TableColor.primaryColor2.withOpacity(0.6),
              TableColor.primaryColor1.withOpacity(0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: TableColor.secondry,
        ),
      ),
    ];
    final tooltipOnBar = lineBarsData[0];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 204, 231),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: TableColor.third,
                ),
                borderRadius: BorderRadius.circular(37),
                boxShadow: [
                  BoxShadow(
                    color: TableColor.primaryColor2,
                    blurRadius: 2,
                    offset: const Offset(0, -2),
                  ),
                ]),
            child: Icon(
              Icons.search,
              color: TableColor.primaryColor3,
              size: 36,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome! ",
                          style: TextStyle(
                            color: TableColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Buddy. ",
                          style: TextStyle(
                            color: TableColor.gray,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NoteFview(),
                          ),
                        );
                      },
                      icon: Image.asset(
                        "assets/img/notification.png",
                        height: 25,
                        width: 25,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Container(
                  height: media.width * 0.5,
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: TableColor.prime,
                    ),
                    borderRadius: BorderRadius.circular(
                      media.width * 0.070,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/img/Banner-Dots.png",
                        height: media.width * 0.4,
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BMI (Body Mass Index) ",
                                  style: TextStyle(
                                    color: TableColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "You have a normal weight",
                                  style: TextStyle(
                                    color: TableColor.white.withOpacity(0.8),
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: media.width * 0.05,
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 120,
                                  child: RButton(
                                    title: "View More.",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    type: RButtonType.bgSGradient,
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                            AspectRatio(
                              aspectRatio: 1,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                      touchCallback: (FlTouchEvent event,
                                          PieTouchResponse) {}),
                                  startDegreeOffset: 230,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                  sections: showingSection(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
                        "Today's Target",
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
                Text(
                  "Activity Status.",
                  style: TextStyle(
                    color: TableColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.02,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: media.width * 0.4,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: TableColor.primaryColor2.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Heart Rate",
                                style: TextStyle(
                                  color: TableColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                          colors: TableColor.third,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ));
                                },
                                child: Text(
                                  "78 BPM",
                                  style: TextStyle(
                                      color: TableColor.white.withOpacity(0.8),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        LineChart(
                          LineChartData(
                            showingTooltipIndicators:
                                showingTooltipOnSpots.map((index) {
                              return ShowingTooltipIndicators([
                                LineBarSpot(
                                  tooltipOnBar,
                                  lineBarsData.indexOf(tooltipOnBar),
                                  tooltipOnBar.spots[index],
                                ),
                              ]);
                            }).toList(),
                            lineTouchData: LineTouchData(
                              enabled: true,
                              handleBuiltInTouches: false,
                              touchCallback: (FlTouchEvent event,
                                  LineTouchResponse? response) {
                                if (response == null ||
                                    response.lineBarSpots == null) {
                                  return;
                                }
                                if (event is FlTapUpEvent) {
                                  final spotIndex =
                                      response.lineBarSpots!.first.spotIndex;
                                  showingTooltipOnSpots.clear();
                                  setState(() {
                                    showingTooltipOnSpots.add(spotIndex);
                                  });
                                }
                              },
                              mouseCursorResolver: (FlTouchEvent event,
                                  LineTouchResponse? response) {
                                if (response == null ||
                                    response.lineBarSpots == null) {
                                  return SystemMouseCursors.basic;
                                }
                                return SystemMouseCursors.click;
                              },
                              getTouchedSpotIndicator:
                                  (LineChartBarData barData,
                                      List<int> spotIndex) {
                                return spotIndex.map((index) {
                                  return TouchedSpotIndicatorData(
                                    const FlLine(color: Colors.transparent),
                                    FlDotData(
                                      show: true,
                                      getDotPainter:
                                          (spot, percent, barData, index) =>
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
                                getTooltipItems:
                                    (List<LineBarSpot> lineBarSpot) {
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
                            lineBarsData: lineBarsData,
                            minY: 0,
                            maxY: 10,
                            titlesData: const FlTitlesData(
                              show: false,
                            ),
                            gridData: const FlGridData(
                              show: false,
                            ),
                            borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: Colors.transparent,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: media.width * 0.95,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 25,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            SimpleAnimationProgressBar(
                              height: media.width * 0.83,
                              width: media.width * 0.07,
                              backgroundColor: Colors.grey.shade100,
                              ratio: 0.5,
                              direction: Axis.vertical,
                              foregrondColor: Colors.purple,
                              duration: const Duration(
                                seconds: 3,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                              borderRadius: BorderRadius.circular(30),
                              gradientColor: LinearGradient(
                                colors: TableColor.prime,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Water Intake!",
                                    style: TextStyle(
                                      color: TableColor.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) {
                                      return LinearGradient(
                                              colors: TableColor.secondry,
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight)
                                          .createShader(Rect.fromLTRB(
                                        0,
                                        0,
                                        bounds.width,
                                        bounds.height,
                                      ));
                                    },
                                    child: Text(
                                      "4 Liters.",
                                      style: TextStyle(
                                          color:
                                              TableColor.white.withOpacity(0.7),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Real Time updates",
                                    style: TextStyle(
                                      color: TableColor.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: waterArr.map(
                                      (wObj) {
                                        var isLast = wObj == waterArr.last;
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 2,
                                                  ),
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                    color: TableColor
                                                        .primaryColor4,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                if (!isLast)
                                                  DottedDashedLine(
                                                    height: media.width * 0.06,
                                                    width: 0,
                                                    dashColor: TableColor
                                                        .primaryColor3
                                                        .withOpacity(0.5),
                                                    axis: Axis.vertical,
                                                  )
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  wObj["title"].toString(),
                                                  style: TextStyle(
                                                    color: TableColor.gray,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                ShaderMask(
                                                  blendMode: BlendMode.srcIn,
                                                  shaderCallback: (bounds) {
                                                    return LinearGradient(
                                                            colors: TableColor
                                                                .secondry,
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight)
                                                        .createShader(
                                                            Rect.fromLTRB(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height,
                                                    ));
                                                  },
                                                  child: Text(
                                                    wObj["subtitle"].toString(),
                                                    style: TextStyle(
                                                        color: TableColor.white
                                                            .withOpacity(0.7),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.05,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: media.width * 0.45,
                            padding: const EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sleep!",
                                  style: TextStyle(
                                    color: TableColor.gray,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                            colors: TableColor.secondry,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)
                                        .createShader(Rect.fromLTRB(
                                      0,
                                      0,
                                      bounds.width,
                                      bounds.height,
                                    ));
                                  },
                                  child: Text(
                                    "8h 20m.",
                                    style: TextStyle(
                                        color:
                                            TableColor.white.withOpacity(0.7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  "assets/img/Sleep-Graph.png",
                                  width: double.maxFinite,
                                  fit: BoxFit.fitWidth,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: media.width * 0.45,
                            padding: const EdgeInsets.symmetric(
                              vertical: 25,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Calories!",
                                  style: TextStyle(
                                    color: TableColor.gray,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                            colors: TableColor.secondry,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)
                                        .createShader(Rect.fromLTRB(
                                      0,
                                      0,
                                      bounds.width,
                                      bounds.height,
                                    ));
                                  },
                                  child: Text(
                                    "740 kCal.",
                                    style: TextStyle(
                                        color:
                                            TableColor.white.withOpacity(0.7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: media.width * 0.2,
                                    height: media.width * 0.2,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: media.width * 0.15,
                                          height: media.width * 0.15,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: TableColor.prime),
                                            borderRadius: BorderRadius.circular(
                                              media.width * 0.085,
                                            ),
                                          ),
                                          child: FittedBox(
                                            child: Text(
                                              "230kCal\nleft.",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: TableColor.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ),
                                        ),
                                        SimpleCircularProgressBar(
                                          progressStrokeWidth: 10,
                                          backStrokeWidth: 10,
                                          startAngle: -180,
                                          backColor: Colors.grey.shade100,
                                          valueNotifier: ValueNotifier(50),
                                          progressColors: TableColor.prime,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
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
                      showingTooltipIndicators:
                          showingTooltipOnSpots.map((index) {
                        return ShowingTooltipIndicators([
                          LineBarSpot(
                            tooltipOnBar,
                            lineBarsData.indexOf(tooltipOnBar),
                            tooltipOnBar.spots[index],
                          ),
                        ]);
                      }).toList(),
                      lineTouchData: LineTouchData(
                        enabled: true,
                        handleBuiltInTouches: false,
                        touchCallback:
                            (FlTouchEvent event, LineTouchResponse? response) {
                          if (response == null ||
                              response.lineBarSpots == null) {
                            return;
                          }
                          if (event is FlTapUpEvent) {
                            final spotIndex =
                                response.lineBarSpots!.first.spotIndex;
                            showingTooltipOnSpots.clear();
                            setState(() {
                              showingTooltipOnSpots.add(spotIndex);
                            });
                          }
                        },
                        mouseCursorResolver:
                            (FlTouchEvent event, LineTouchResponse? response) {
                          if (response == null ||
                              response.lineBarSpots == null) {
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
                                getDotPainter:
                                    (spot, percent, barData, index) =>
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Workout",
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
                    itemCount: lastWorkoutArr.length,
                    itemBuilder: (context, index) {
                      var wObj = lastWorkoutArr[index] as Map? ?? {};
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const WorkDone()));
                          },
                          child: WorkoutRow(wObj: wObj));
                    }),
                SizedBox(
                  height: media.width * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSection() {
    return List.generate(2, (i) {
      var color0 = TableColor.primaryColor1;
      switch (i) {
        case 0:
          return PieChartSectionData(
              color: color0,
              value: 33,
              title: "",
              radius: 50,
              titlePositionPercentageOffset: 0.55,
              badgeWidget: const Text(
                "21.2",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ));
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: 75,
            title: "",
            radius: 42,
            titlePositionPercentageOffset: 0.1,
          );
        default:
          throw Error();
      }
    });
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
