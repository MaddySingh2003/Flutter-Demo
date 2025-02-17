import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

enum RButtonType { bgGradient, bgSGradient, textGradient }

class RButton extends StatelessWidget {
  final String title;
  final RButtonType type;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;

  const RButton(
      {super.key,
      required this.title,
      this.elevation = 1,
      this.type = RButtonType.bgGradient,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w700,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: type == RButtonType.bgSGradient
              ? TableColor.four
              : TableColor.prime,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow:
            type == RButtonType.bgGradient || type == RButtonType.bgSGradient
                ? const [
                    BoxShadow(
                        color: Colors.white70,
                        blurRadius: 0.5,
                        offset: Offset(0, 0.5))
                  ]
                : null,
      ),
      child: MaterialButton(
          onPressed: onPressed,
          height: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          textColor: TableColor.primaryColor1,
          elevation:
              type == RButtonType.bgGradient || type == RButtonType.bgSGradient
                  ? 0
                  : elevation,
          color:
              type == RButtonType.bgGradient || type == RButtonType.bgSGradient
                  ? Colors.transparent
                  : TableColor.white,
          minWidth: double.maxFinite,
          //media.width,
          child:
              type == RButtonType.bgGradient || type == RButtonType.bgSGradient
                  ? Text(
                      title,
                      style: TextStyle(
                          color: TableColor.black,
                          fontSize: fontSize,
                          fontWeight: fontWeight),
                    )
                  : ShaderMask(
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
                        title,
                        style: TextStyle(
                            color: TableColor.black,
                            fontSize: fontSize,
                            fontWeight: fontWeight),
                      ),
                    )),
    );
  }
}
