import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';

class MealRecc extends StatelessWidget {
  final Map fObj;
  final int index;
  const MealRecc({
    super.key,
    required this.fObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isEvent = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.all(8),
      width: media.width * 0.5,
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(75),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fObj["image"].toString(),
                width: media.width * 0.3,
                height: media.width * 0.25,
                fit: BoxFit.contain,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              fObj["name"].toString(),
              style: TextStyle(
                color: TableColor.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              fObj["size"].toString(),
              style: TextStyle(
                color: TableColor.gray,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              fObj["time"].toString(),
              style: TextStyle(
                color: TableColor.gray,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              fObj["kcal"].toString(),
              style: TextStyle(
                color: TableColor.gray,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: SizedBox(
              width: 90,
              height: 25,
              child: RButton(
                type:
                    isEvent ? RButtonType.bgGradient : RButtonType.bgSGradient,
                fontSize: 12,
                title: "View",
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
