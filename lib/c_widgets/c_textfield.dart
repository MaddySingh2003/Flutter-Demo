import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class CTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final EdgeInsets? margin;
  final bool obsecureText;
  final Widget? rightIcon;

  const CTextfield({
    this.rightIcon,
    this.keyboardType,
    super.key,
    this.controller,
    required this.hintText,
    this.margin,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: TableColor.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 15,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          suffixIcon: rightIcon,
          hintStyle: TextStyle(
            color: TableColor.gray,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
