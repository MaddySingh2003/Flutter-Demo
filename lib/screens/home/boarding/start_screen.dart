import 'package:flutter/material.dart';

import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/screens/home/boarding/boarding_sc.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool isChangeColor = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TableColor.primaryColor2,
      body: Container(
          width: media.width,
          decoration: BoxDecoration(
            gradient: isChangeColor
                ? LinearGradient(
                    colors: TableColor.prime,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "GROW UP",
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 37,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Start New Journey!",
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: RButton(
                      title: "Get Started",
                      type: isChangeColor
                          ? RButtonType.bgGradient
                          : RButtonType.bgSGradient,
                      onPressed: () {
                        if (isChangeColor) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OnboardSc()));
                        } else {
                          setState(() {
                            isChangeColor = true;
                          });
                        }
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
