import 'package:flutter/material.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/meals/plan_v.dart';
import 'package:grow_up/tacker/workout_t.dart';

class Selectview extends StatelessWidget {
  const Selectview({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RButton(
                title: "Workout Tracker",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutT(),
                    ),
                  );
                }),
            SizedBox(
              height: 15,
            ),
            RButton(
                title: "Meal Tracker",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlanV(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
