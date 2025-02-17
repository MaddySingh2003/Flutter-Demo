

import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class ExRow extends StatelessWidget {
  final Map eObj;
  final VoidCallback onPressed;
  const ExRow({super.key, required this.eObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              eObj["image"].toString(),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eObj["title"].toString(),
                  style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  eObj["time"].toString(),
                  style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              "assets/img/Workout-Btn.png",
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
