import 'package:flutter/material.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class PopularMeal extends StatelessWidget {
  final Map mObj;
  const PopularMeal({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    bool Positive = false;
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          color: TableColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
          ]),
      child: Row(
        children: [
       Image.asset(
              mObj["image"].toString(),
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
          
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mObj["name"].toString(),
                  style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                 "${mObj["size"]}|${mObj["time"]}| ${mObj["kcal"]}",
                  style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                //   SimpleAnimationProgressBar(
                //     height: 15,
                //     width: media.width * 0.5,
                //     backgroundColor: Colors.grey.shade100,
                //     ratio: mObj["progress"] as double? ?? 0.0,
                //     direction: Axis.horizontal,
                //     foregrondColor: Colors.purple,
                //     duration: const Duration(
                //       seconds: 3,
                //     ),
                //     curve: Curves.fastLinearToSlowEaseIn,
                //     borderRadius: BorderRadius.circular(7.5),
                //     gradientColor: LinearGradient(
                //       colors: TableColor.prime,
                //       begin: Alignment.centerLeft,
                //       end: Alignment.centerRight,
                //     ),
                //   ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next_sharp))

          // CustomAnimatedToggleSwitch<bool>(
          //   animationCurve: Curves.linear,

          //   current: positive,
          //   values: [false, true],
          //   indicatorSize: Size.square(15.0),
          //   animationDuration: const Duration(milliseconds: 200),
          //   onChanged: (b) => setState(() => positive = b),
          //   iconBuilder: (context, local, global) {
          //     return const SizedBox();
          //   },
          //   cursors: ToggleCursors(),
          //   // onTap: () => setState(() => positive = !positive),
          //   iconsTappable: false,
          //   wrapperBuilder: (context, global, child) {
          //     return Stack(
          //       alignment: Alignment.center,
          //       children: [
          //         Positioned(
          //           left: 10.0,
          //           right: 10.0,
          //           height: 30.0,
          //           child: DecoratedBox(
          //             decoration: BoxDecoration(
          //               gradient: LinearGradient(colors: TableColor.secondry),
          //               borderRadius:
          //                   const BorderRadius.all(Radius.circular(50)),
          //             ),
          //           ),
          //         )
          //       ],
          //     );
          //   },
          //   foregroundIndicatorBuilder: (context, global) {
          //     return SizedBox.fromSize(
          //       size: const Size(10, 10),
          //       child: DecoratedBox(
          //         decoration: BoxDecoration(
          //             color: TableColor.white,
          //             borderRadius: const BorderRadius.all(Radius.circular(50)),
          //             boxShadow: const [
          //               BoxShadow(
          //                 color: Colors.black38,
          //                 spreadRadius: 0.05,
          //                 blurRadius: 1.1,
          //                 offset: Offset(0.0, 0.8),
          //               ),
          //             ]),
          //       ),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
