import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/screens/home/login/login_p.dart';

class Goalset extends StatefulWidget {
  const Goalset({super.key});

  @override
  State<Goalset> createState() => _GoalsetState();
}

class _GoalsetState extends State<Goalset> {
  //CarouselController buttonCarouselController = CarouselController();
  CarouselSliderController buttonCarouselSController =
      CarouselSliderController();
  List goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat\n and need/want to build more\nmuscel",
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I'm \"skinny fat\". look thin but have\n no shape.I want to add lean\n muscel in the right way",
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Lose a Fat",
      "subtitle":
          "I have over 20 lbs to lose.I want to\n drop all this fat and gain muscle\n mass",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TableColor.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
                items: goalArr
                    .map((gObj) => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: TableColor.prime,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: media.width * 0.07,
                            horizontal: 25,
                          ),
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Column(
                              children: [
                                Image.asset(
                                  gObj["image"].toString(),
                                  width: media.width * 0.5,
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  height: media.width * 0.05,
                                ),
                                Text(
                                  gObj["title"].toString(),
                                  style: TextStyle(
                                    color: TableColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  width: media.width * 0.1,
                                  height: 1,
                                  color: TableColor.white,
                                ),
                                SizedBox(
                                  height: media.width * 0.04,
                                ),
                                Text(
                                  gObj["subtitle"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: TableColor.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
                carouselController: buttonCarouselSController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 0.7,
                  initialPage: 0,
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  " What is your goal!  ",
                  style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "It will help us to choose a best \n program for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TableColor.gray, fontSize: 12),
                ),
                const Spacer(),
                SizedBox(
                  height: media.width * 0.50,
                ),
                // Text(
                //   "Let's Make Your Profile!  ",
                //   style: TextStyle(
                //     color: TableColor.white,
                //     fontSize: 26,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                // SizedBox(
                //   height: media.width * 0.05,
                // ),
                RButton(
                    title: "Confirm",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginP(),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}
