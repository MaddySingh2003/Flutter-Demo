import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/onboard_page.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/screens/home/login/signup_sc.dart';

class OnboardSc extends StatefulWidget {
  const OnboardSc({super.key});

  @override
  State<OnboardSc> createState() => _OnboardScState();
}

class _OnboardScState extends State<OnboardSc> {
  int selectPage = 0;
  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "START NEW WAY",
      "subtitle":
          "Whether you want to lose weight, build muscle, or boost endurance, we’re here to help you stay focused!",
      "image": "assets/img/on_5.png",
    },
    {
      "title": "BE READY",
      "subtitle":
          "Welcome to your fitness journey! At GROW UP, we believe that getting fit is not just about working out—it's about preparing your mind and body for the challenge ahead.",
      "image": "assets/img/on_2.png",
    },
    {
      "title": "THE DIET",
      "subtitle":
          "Are you ready to transform your diet and enhance your fitness journey? Let’s dive in!",
      "image": "assets/img/on_3.png",
    },
    {
      "title": "IMPROVE SLEEP QUALITY",
      "subtitle":
          "Discover techniques and tips designed to enhance your sleep quality. From relaxation exercises to bedtime routines, we’ll guide you toward a more restorative night’s sleep.",
      "image": "assets/img/on_4.png",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, //white
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return OnboardPage(pObj: pObj);
            },
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TableColor.primaryColor4,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      color: TableColor.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    icon: Icon(
                      Icons.navigate_next,
                      color: TableColor.primaryColor4,
                    ),
                    color: TableColor.primaryColor3,
                    onPressed: () {
                      if (selectPage < 3) {
                        selectPage = selectPage + 1;
                        controller.animateToPage(selectPage,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut);
                        controller.jumpToPage(selectPage);
                        setState(() {});
                      } else {
                        print("WELCOME SCREEN!");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpSc(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
