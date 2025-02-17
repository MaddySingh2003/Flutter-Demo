import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class Spot extends StatelessWidget {
  final bool isLast;
  final Map sObj;
  const Spot({
    super.key,
    this.isLast = false,
    required this.sObj,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30,
          child: Text(
            sObj["no"].toString(),
            style: TextStyle(
              color: TableColor.primaryColor3,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 2,
              ),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: TableColor.primaryColor4,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 2,
                ),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  border: Border.all(color: TableColor.white, width: 5),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            if (!isLast)
              DottedDashedLine(
                height: 73,
                width: 0,
                dashColor: TableColor.primaryColor3.withOpacity(0.5),
                axis: Axis.vertical,
              )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sObj["title"].toString(),
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                sObj["detail"].toString(),
                style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
