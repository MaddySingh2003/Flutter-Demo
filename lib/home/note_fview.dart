import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/notify_row.dart';
import 'package:grow_up/common/color_e.dart';

class NoteFview extends StatefulWidget {
  const NoteFview({super.key});

  @override
  State<NoteFview> createState() => _NoteFviewState();
}

class _NoteFviewState extends State<NoteFview> {
  List notifyArr = [
    {
      "image": "assets/img/Ellipse.png",
      "title": "Hey, it’s time for lunch",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/img/Ellipse (1).png",
      "title": "Don’t miss your lowerbody workout",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/img/Ellipse (2).png",
      "title": "Hey, let’s add some meals for your body.",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/img/Ellipse (3).png",
      "title": "Congratulations, You have finished A workout.",
      "time": "29 May"
    },
    {
      "image": "assets/img/Ellipse.png",
      "title": "Hey, it’s time for lunch",
      "time": "8 April"
    },
    {
      "image": "assets/img/Ellipse (4).png",
      "title": "Ups, You have missed your Lowerbody...",
      "time": "3 April"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "Notification",
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var nObj = notifyArr[index] as Map? ?? {};
          return NotifyRow(nObj: nObj);
        }),
        separatorBuilder: (context, index) {
          return Divider(
            color: TableColor.gray.withOpacity(0.5),
            height: 1,
          );
        },
        itemCount: notifyArr.length,
      ),
    );
  }
}
