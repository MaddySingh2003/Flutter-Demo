import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';

class OnboardPage extends StatelessWidget {
  final Map pObj;

  const OnboardPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              pObj["image"].toString(),
            ),
            fit: BoxFit.cover),
      ),
      child: SizedBox(
        width: media.width,
        height: media.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media.width * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  pObj["title"].toString(),
                  style: TextStyle(
                      color: TableColor.gray,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  pObj["subtitle"].toString(),
                  style: TextStyle(
                    color: TableColor.white,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
