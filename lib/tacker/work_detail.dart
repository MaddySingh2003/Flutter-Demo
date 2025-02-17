import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/common/spot.dart';
import 'package:readmore/readmore.dart';

class WorkDetail extends StatefulWidget {
  final Map eObj;
  const WorkDetail({super.key, required this.eObj});

  @override
  State<WorkDetail> createState() => _WorkDetailState();
}

class _WorkDetailState extends State<WorkDetail> {
  List stepArr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "detail":
          "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "detail":
          "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"
    },
    {
      "no": "02",
      "title": "Adjust Foot Movement",
      "detail":
          "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "detail":
          "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.withOpacity(0.1),
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
            // child:
            child: const Icon(Icons.cancel),
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: TableColor.prime,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      alignment: Alignment.topRight,
                      "assets/img/up1.png",
                      width: media.width,
                      height: media.width * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.44,
                    decoration: BoxDecoration(
                        color: TableColor.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      alignment: Alignment.topLeft,
                      "assets/img/up1.png",
                      width: media.width,
                      height: media.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle,
                      size: 46,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                    color: TableColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Easy | 390 Calories Burn",
                style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 11,
                    fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Description!",
                style: TextStyle(
                    color: TableColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              ReadMoreText(
                "A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide ",
                trimLines: 3,
                colorClickableText: TableColor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read More..',
                trimExpandedText: "Read Less..",
                style: TextStyle(
                  color: TableColor.gray,
                  fontSize: 13,
                ),
                moreStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                      color: TableColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${stepArr.length} sets",
                      style: TextStyle(
                        color: TableColor.gray,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: stepArr.length,
                itemBuilder: ((context, index) {
                  var sObj = stepArr[index] as Map? ?? {};
                  return Spot(
                    sObj: sObj,
                    isLast: stepArr.last == sObj,
                  );
                }),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Custom Repetition",
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 150,
                child: CupertinoPicker.builder(
                  itemExtent: 40,
                  selectionOverlay: Container(
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: TableColor.gray.withOpacity(0.3), width: 1),
                        bottom: BorderSide(
                            color: TableColor.gray.withOpacity(0.3), width: 1),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (index) {},
                  childCount: 60,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/fire.png",
                          height: 15,
                          width: 15,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "450 Calories Burn",
                          style:
                              TextStyle(color: TableColor.gray, fontSize: 10),
                        ),
                        Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: TableColor.gray,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "time",
                          style:
                              TextStyle(color: TableColor.gray, fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
              ),
              RButton(
                title: "SAVE",
                elevation: 0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
