import 'package:flutter/material.dart';
import 'package:grow_up/camera/resultv.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/icon_t.dart';
import 'package:grow_up/common/r_button.dart';

class Compersion extends StatefulWidget {
  const Compersion({super.key});

  @override
  State<Compersion> createState() => _CompersionState();
}

class _CompersionState extends State<Compersion> {
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
          "Comperision",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            IconT(
              icon: Icon(Icons.calendar_month),
              title: "Select Month 1",
              time: "December",
              onPressed: () {},
              color: TableColor.lightGrey
                  .withOpacity(0.8), //Colors.white.withOpacity(0.7),
            ),
            const SizedBox(
              height: 15,
            ),
            IconT(
              icon: Icon(Icons.calendar_month),
              title: "Select Month 2",
              time: "Select Month",
              onPressed: () {},
              color: TableColor.lightGrey
                  .withOpacity(0.8), //Colors.white.withOpacity(0.7),
            ),
            const Spacer(),
            RButton(
              title: "Compare",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultV(
                      date1: DateTime(2024, 11, 30),
                      date2: DateTime(2024, 12, 01),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
