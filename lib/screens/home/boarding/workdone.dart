import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/main_w/m_tab.dart';

class WorkDone extends StatefulWidget {
  const WorkDone({super.key});

  @override
  State<WorkDone> createState() => _WorkDoneState();
}

class _WorkDoneState extends State<WorkDone> {
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
                "assets/img/w_done.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Congratulations, You Have Finished Your Workout",
                style: TextStyle(
                  color: TableColor.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TableColor.gray,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: media.width * 0.05,
              ),
              RButton(
                  title: "Back To Home",
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
