import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/icon_t.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/common/set_view.dart';
import 'package:grow_up/tacker/work_detail.dart';

class WDetail extends StatefulWidget {
  final Map dObj;
  const WDetail({super.key, required this.dObj});

  @override
  State<WDetail> createState() => _WDetailState();
}

class _WDetailState extends State<WDetail> {
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
  List needArr = [
    {
      "image": "assets/img/barbel.png",
      "title": "Barbell",
    },
    {
      "image": "assets/img/skipping-rope.png",
      "title": "Skipping Rope",
    },
    {
      "image": "assets/img/Nutrition.png",
      "title": "Protien",
    },
  ];
  List exArr = [
    {
      "name": "set 1",
      "set": [
        {"image": "assets/img/wormup.png", "title": "Warm Up", "time": "05:00"},
        {"image": "assets/img/jJak.png", "title": "Jumping jack", "time": ""},
        {"image": "assets/img/skip.png", "title": "Skipping", "time": "15x"},
        {"image": "assets/img/sq.png", "title": "Squarts", "time": "120x"},
        {"image": "assets/img/aw.png", "title": "Arm Raises", "time": "00:53"},
        {
          "image": "assets/img/drink.png",
          "title": "Rest and Drink",
          "time": "02:00"
        },
      ]
    },
    {
      "name": "set 2",
      "set": [
        {
          "image": "assets/img/ips.png",
          "title": "Incline PushUpa",
          "time": "12x",
        },
        {"image": "assets/img/plank.png", "title": "Planks", "time": "15x"},
        {"image": "assets/img/w1.png", "title": "Cycling", "time": "08:00"},
      ]
    }
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
              backgroundColor: TableColor.primaryColor3.withOpacity(0.4),
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
                      child:const Icon(Icons.menu)),
                ),
              ],
            ),
            SliverAppBar(
              backgroundColor: TableColor.primaryColor3.withOpacity(0.5),
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/img/do1.png",
                  width: media.width,
                  height: media.width,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding:const EdgeInsets.symmetric(horizontal: 20),
          decoration:const BoxDecoration(
            color: Color.fromARGB(255, 255, 204, 231),
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(children: [
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
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Body Workout!",
                                style: TextStyle(
                                  color: TableColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/img/Icon.png",
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    IconT(
                        color: TableColor.primaryColor2.withOpacity(0.5),
                        icon:const Icon(Icons.calendar_month_outlined),
                        title: "Schedule Workout",
                        time: "5/27, 09:00 AM",
                        onPressed: () {}),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    IconT(
                      color: TableColor.primaryColor3.withOpacity(0.6),
                      icon:const Icon(Icons.compare_arrows_outlined),
                      title: "Difficulity",
                      time: "Biginner  ",
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "You'II Need",
                          style: TextStyle(
                            color: TableColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "${needArr.length} items",
                            style: TextStyle(
                              color: TableColor.gray,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.5,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: needArr.length,
                        itemBuilder: (context, index) {
                          var nObj = needArr[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color:
                                          TableColor.lightGrey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: media.width * 0.35,
                                  width: media.width * 0.35,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    nObj["image"].toString(),
                                    width: media.width * 0.2,
                                    height: media.width * 0.2,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    nObj["title"].toString(),
                                    style: TextStyle(
                                      color: TableColor.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Excersisef",
                          style: TextStyle(
                            color: TableColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "${needArr.length} sets",
                            style: TextStyle(
                              color: TableColor.gray,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: exArr.length,
                      itemBuilder: (context, index) {
                        var sObj = exArr[index] as Map? ?? {};
                        return SetView(
                          sObj: sObj,
                          onPressed: (obj) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkDetail(
                                  eObj: obj,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    )
                  ]),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RButton(
                        title: "Start Workout",
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
