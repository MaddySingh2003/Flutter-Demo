import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class BlankView extends StatefulWidget {
  const BlankView({super.key});

  @override
  State<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends State<BlankView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TableColor.primaryColor1,
    );
  }
}
