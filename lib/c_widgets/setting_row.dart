import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class SettingRow extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onPressed;
  const SettingRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 12,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 12,
            )
          ],
        ),
      ),
    );
    
  }
}
