import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class IconT extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onPressed;
  final String time;
  final Color color;
  const IconT(
      {super.key,
      required this.icon,
      required this.title,
      required this.time,
    required  this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: icon,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: TableColor.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Text(
                time,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: TableColor.gray,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 25,
              width: 70,
              child: Icon(Icons.navigate_next_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
