import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class TabB extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isActive;
  const TabB({
    super.key,
    required this.icon,
    required this.selectIcon,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? selectIcon : icon,
            width: 25,
            height: 25,
            color: TableColor.primaryColor2,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: isActive ? 8 : 12,
          ),
          if (isActive)
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: TableColor.prime,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            )
        ],
      ),
    );
  }
}
