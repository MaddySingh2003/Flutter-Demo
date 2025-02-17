import 'package:flutter/material.dart';

import 'package:grow_up/c_widgets/setting_row.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/common/t_s_cell.dart';

class PView extends StatefulWidget {
  const PView({
    super.key,
  });

  @override
  State<PView> createState() => _PViewState();
}

class _PViewState extends State<PView> {
  bool positive = false;
  List acoounArr = [
    {
      "icon": const Icon(
        Icons.account_box,
      ),
      "name": "Presonal Info.",
      "tag": "1"
    },
    {
      "icon": const Icon(
        Icons.document_scanner_outlined,
      ),
      "name": "Achievements.",
      "tag": "2"
    },
    {
      "icon": const Icon(
        Icons.history_rounded,
      ),
      "name": "Activity History.",
      "tag": "3"
    },
    {
      "icon": const Icon(
        Icons.bar_chart_sharp,
      ),
      "name": "Workout Progress.",
      "tag": "4"
    }
  ];
  List otherArr = [
    {
      "icon": const Icon(
        Icons.mode_comment_rounded,
      ),
      "name": "Contact Us.",
      "tag": "5"
    },
    {
      "icon": const Icon(
        Icons.privacy_tip,
      ),
      "name": "Privacy Police.",
      "tag": "7"
    },
    {
      "icon": const Icon(
        Icons.settings,
      ),
      "name": "Setting.",
      "tag": "7"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 204, 231),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "PROFILE",
          style: TextStyle(
            color: TableColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: TableColor.lightGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.menu)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color:
                    const Color.fromARGB(255, 182, 216, 244).withOpacity(0.7),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/img/Frame 17.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              color: TableColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " Lose a Fat Program!",
                            style: TextStyle(
                              color: TableColor.gray,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 70,
                      child: RButton(
                        title: "Edit",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        type: RButtonType.bgGradient,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Expanded(
                    child: TSCell(
                      title: "180 cm",
                      subtitle: "Height",
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TSCell(
                      title: "65 Kg",
                      subtitle: "Weight",
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TSCell(
                      title: "22 yo",
                      subtitle: "Age",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 182, 216, 244).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        color: TableColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: acoounArr.length,
                        itemBuilder: (context, index) {
                          var iObj = acoounArr[index] as Map? ?? {};
                          return SettingRow(
                              icon: iObj["icon"],
                              title: iObj["name"].toString(),
                              onPressed: () {});
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 182, 216, 244).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notification",
                      style: TextStyle(
                        color: TableColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.notifications_active),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Pop-up Notification.",
                              style: TextStyle(
                                color: TableColor.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          // CustomAnimatedToggleSwitch<bool>(
                          //   animationCurve: Curves.linear,

                          //   current: positive,
                          //   values: [false, true],
                          //   indicatorSize: Size.square(15.0),
                          //   animationDuration:
                          //       const Duration(milliseconds: 200),
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
                          //               gradient: LinearGradient(
                          //                   colors: TableColor.secondry),
                          //               borderRadius: const BorderRadius.all(
                          //                   Radius.circular(50)),
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
                          //             borderRadius: const BorderRadius.all(
                          //                 Radius.circular(50)),
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
                    ),

                    // CustomAnimatedToggleSwitch<bool>(
                    //   current: positive,
                    //   values: [true, false],
                    //   wrapperBuilder: (context, global, child) {
                    //     return Stack(
                    //       alignment: Alignment.center,
                    //       children: [
                    //         Positioned(
                    //           left: 300.0,
                    //           right: 10.0,
                    //           height: 20.0,
                    //           child: DecoratedBox(
                    //             decoration: BoxDecoration(
                    //               gradient: LinearGradient(
                    //                   colors: TableColor.secondry),
                    //               borderRadius: const BorderRadius.all(
                    //                   Radius.circular(50)),
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     );
                    //   }, // the builder for the wrapper around the whole switch
                    //   iconBuilder: (context, local, global) {
                    //     return const SizedBox();
                    //   }, // the builder for the icons
                    //   foregroundIndicatorBuilder: (context, global) {
                    //     return SizedBox.fromSize(
                    //       size: const Size(10, 10),
                    //       child: DecoratedBox(
                    //         decoration: BoxDecoration(
                    //             color: TableColor.white,
                    //             borderRadius:
                    //                 const BorderRadius.all(Radius.circular(50)),
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
                    //   }, // a builder for an indicator in front of the icons
                    //   // backgroundIndicatorBuilder: ..., // a builder for an indicator behind the icons
                    //   // ... // many more parameters available
                    // )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 182, 216, 244).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Others",
                      style: TextStyle(
                        color: TableColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: otherArr.length,
                        itemBuilder: (context, index) {
                          var iObj = otherArr[index] as Map? ?? {};
                          return SettingRow(
                              icon: iObj["icon"],
                              title: iObj["name"].toString(),
                              onPressed: () {});
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
