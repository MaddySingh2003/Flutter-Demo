import 'package:flutter/material.dart';
import 'package:grow_up/camera/comparision.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  List photoArr = [
    {
      "time": "Today",
      "photo": [
        "assets/img/5_1.png",
        "assets/img/5_2.png",
        "assets/img/5_3.png",
        "assets/img/5_4.png"
      ]
    },
    {
      "time": "Tommorrow",
      "photo": [
        "assets/img/bo1.png",
        "assets/img/bo2.png",
        "assets/img/bo3.png",
        "assets/img/bo4.png",
      ]
    }
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
          "Progress Tracker",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                height: 85,
                decoration: BoxDecoration(
                  color: const Color(0xffFFE5E5).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_alarm_rounded,
                      size: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Reminder!",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            ),
                            Text(
                              "Next Photos Fall On ____ 08",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: TableColor.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 150),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.cancel),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                height: media.width * 0.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      TableColor.primaryColor2.withOpacity(0.4),
                      TableColor.primaryColor1.withOpacity(0.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Track Your Progress Each\n Month With Photo",
                          style: TextStyle(
                            color: TableColor.black,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 110,
                          height: 35,
                          child: RButton(
                            title: "Learn More",
                            onPressed: () {},
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/img/calender.png",
                      width: media.width * 0.35,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
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
                      "Compare My Photo!",
                      style: TextStyle(
                        color: TableColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 100,
                      child: RButton(
                        title: "Compare",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Compersion(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gallery",
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
            ),
            ListView.builder(
              shrinkWrap: true,
              //  scrollDirection: const ,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: photoArr.length,
              itemBuilder: ((context, index) {
                var pObj = photoArr[index] as Map? ?? {};
                var imaArr = pObj["photo"] as List? ?? {};
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        pObj["time"].toString(),
                        style: TextStyle(color: TableColor.gray, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemCount: imaArr.length,
                        itemBuilder: ((context, indexRow) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            width: 100,
                            decoration: BoxDecoration(
                              color: TableColor.lightGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              child: Image.asset(
                                (imaArr.toList())[indexRow] as String? ?? "",
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                );
              }),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
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
              Icons.photo_camera,
              color: TableColor.primaryColor3,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
