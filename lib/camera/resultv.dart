import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/icon_t.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class ResultV extends StatefulWidget {
  final DateTime date1;
  final DateTime date2;
  const ResultV({super.key, required this.date1, required this.date2});

  @override
  State<ResultV> createState() => _ResultVState();
}

class _ResultVState extends State<ResultV> {
  int selctButton = 0;
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
          "Reault",
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
              child: Icon(Icons.share_sharp),
            ),
          ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: TableColor.lightGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      alignment: selctButton == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(microseconds: 250),
                      child: Container(
                        width: (media.width * 0.5) - 40,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: TableColor.prime,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selctButton = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Photo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selctButton == 0
                                        ? TableColor.white
                                        : TableColor.gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selctButton = 1;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Stats",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selctButton == 1
                                        ? TableColor.white
                                        : TableColor.gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (selctButton == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Average Progress!",
                          style: TextStyle(
                            color: TableColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Good",
                          style: TextStyle(
                            color: TableColor.primaryColor2,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SimpleAnimationProgressBar(
                          ratio: 0.61,
                          width: media.width - 40,
                          height: 20,
                          direction: Axis.horizontal,
                          backgroundColor: Colors.grey.shade100,
                          foregrondColor: Colors.purple,
                          duration: const Duration(
                            seconds: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          gradientColor: LinearGradient(
                              colors: TableColor.prime,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          curve: Curves.fastLinearToSlowEaseIn,
                        ),
                        Text(
                          "61%",
                          style: TextStyle(
                            color: TableColor.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "November",
                          style: TextStyle(
                            color: TableColor.gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "December",
                          style: TextStyle(
                            color: TableColor.gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (selctButton == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
