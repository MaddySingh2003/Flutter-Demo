import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';

class MealCell extends StatelessWidget {
  final Map cObj;
  final int index;
  const MealCell({
    super.key,
    required this.cObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isEvent = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.all(10),
      width: 90,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEvent
              ? [
                  TableColor.primaryColor2.withOpacity(0.5),
                  TableColor.primaryColor1.withOpacity(0.5),
                ]
              : [
                  TableColor.primaryColor2.withOpacity(0.5),
                  TableColor.primaryColor3.withOpacity(0.5),
                ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: Container(
              decoration: BoxDecoration(
                color: TableColor.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Image.asset(
                cObj["image"].toString(),
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Text(
              cObj["name"].toString(),
              style: TextStyle(
                color: TableColor.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
