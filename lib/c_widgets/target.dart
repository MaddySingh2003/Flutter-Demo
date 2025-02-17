import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class Target1 extends StatelessWidget {
  final String value;
  final String title;
  const Target1({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: TableColor.primaryColor1.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: TableColor.black,
                    fontSize: 12,
                  ),
                ),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                            colors: TableColor.third,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)
                        .createShader(Rect.fromLTRB(
                      0,
                      0,
                      bounds.width,
                      bounds.height,
                    ));
                  },
                  child: Text(
                    value,
                    style: TextStyle(
                      color: TableColor.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
