import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class TSCell extends StatelessWidget {
  final String title;
  final String subtitle;
  const TSCell({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: TableColor.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                      colors: TableColor.prime,
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
              title,
              style: TextStyle(
                  color: TableColor.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: TableColor.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
