import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/latest_row.dart';
import 'package:grow_up/c_widgets/target.dart';
import 'package:grow_up/common/color_e.dart';

class ActivityT extends StatefulWidget {
  const ActivityT({super.key});

  @override
  State<ActivityT> createState() => _ActivityTState();
}

class _ActivityTState extends State<ActivityT> {
  int touchedIndex = -1;
  List latestyArr = [
    {
      "image": "assets/img/Latest-Pic.png",
      "title": "Drinking 300ml Water",
      "time": "About 3 minutes ago"
    },
    {
      "image": "assets/img/Vector (1).png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 10 minutes ago"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 204, 231),
      appBar: AppBar(
        backgroundColor: TableColor.white.withOpacity(0.8),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TableColor.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/Back-Navs (1).png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          "Activities!",
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      TableColor.primaryColor2.withOpacity(0.5),
                      TableColor.primaryColor2.withOpacity(0.5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
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
                          height: 30,
                          width: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TableColor.secondry,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                height: 30,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: TableColor.primaryColor1,
                                elevation: 0,
                                color: Colors.transparent,
                                minWidth: double.maxFinite,
                                //media.width,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 17,
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Target1(value: "5L", title: "Water Intake!"),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Target1(value: "4000", title: "Foot Steps!"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activity Progress!",
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
              Container(
                height: media.width * 0.5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                decoration: BoxDecoration(
                    color: TableColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ]),
                child: BarChart(
                  BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipHorizontalAlignment:
                              FLHorizontalAlignment.right,
                          tooltipMargin: -10,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            String weekDay;
                            switch (group.x) {
                              case 0:
                                weekDay = "Maonday";
                                break;
                              case 1:
                                weekDay = "Tuesday";
                                break;
                              case 2:
                                weekDay = "Wednesday";
                                break;
                              case 3:
                                weekDay = "Thursday";
                                break;
                              case 4:
                                weekDay = "Friday";
                                break;
                              case 5:
                                weekDay = "Saturday";
                                break;
                              case 6:
                                weekDay = "Sunday";
                                break;
                              default:
                                throw Error();
                            }
                            return BarTooltipItem(
                                '$weekDay\n',
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: (rod.toY - 1).toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]);
                          },
                        ),
                        touchCallback: (
                          FlTouchEvent event,
                          barTouchResponse,
                        ) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: getTitles,
                            reservedSize: 38,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingGroups(),
                      gridData: FlGridData(
                        show: false,
                      )),
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Ativity!",
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
                    return LatestRow(wObj: wObj);
                  }),
              SizedBox(
                height: media.width * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var Style = TextStyle(
      color: TableColor.gray,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 6:
        text = Text(
          'Sat',
          style: Style,
        );
        break;
      case 0:
        text = Text(
          'Sun',
          style: Style,
        );
        break;
      case 1:
        text = Text(
          'Mon',
          style: Style,
        );
        break;
      case 2:
        text = Text(
          'Tue',
          style: Style,
        );
        break;
      case 3:
        text = Text(
          'Wed',
          style: Style,
        );
        break;
      case 4:
        text = Text(
          'Thu',
          style: Style,
        );
        break;
      case 5:
        text = Text(
          'Fri',
          style: Style,
        );
        break;

      default:
        text = Text(
          '',
          style: Style,
        );
        break;
    }
    return SideTitleWidget(
      child: text,
      axisSide: meta.axisSide,
      space: 16,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });
  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showToolTips = const [],
  }) {
    //barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: Colors.green,
          width: width,
          borderSide: isTouched
              ? const BorderSide(
                  color: Colors.green,
                )
              : const BorderSide(
                  color: Colors.white,
                  width: 0,
                ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: TableColor.lightGrey,
          ),
        ),
      ],
      showingTooltipIndicators: showToolTips,
    );
  }
}
