import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/main_w/m_tab.dart';


class WScreen extends StatefulWidget {
  const WScreen({super.key});

  @override
  State<WScreen> createState() => _WScreenState();
}

class _WScreenState extends State<WScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TableColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: media.width * 0.2,
              ),
              Image.asset(
                "assets/img/w_1.png",
                width: media.width * 0.8,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Welcome!",
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "You are all set now. let's reach your\n goals together with use.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TableColor.gray,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: media.width * 0.05,
              ),
              RButton(
                  title: "Go To Home",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MTab(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
