
import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/ex_row.dart';

class SetView extends StatelessWidget {
  final Map sObj;
  final Function(Map obj) onPressed;
  const SetView({super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var exArr = sObj["set"] as List? ?? {};
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sObj["name"].toString(),
          style: TextStyle(
            color: TableColor.gray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: exArr.length,
          itemBuilder: (context, index) {
            var eObj = exArr.toList()[index] as Map? ?? {};
 //[index]
            return ExRow(
              eObj: eObj,
              onPressed: () {
                onPressed(eObj);
              },
            );
          },
        )
      ],
    );
  }
}
