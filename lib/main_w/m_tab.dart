import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/tab_b.dart';
import 'package:grow_up/camera/progress.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/home/blank_p.dart';
import 'package:grow_up/home/home_v.dart';
import 'package:grow_up/main_w/selectview.dart';
import 'package:grow_up/profile/p_view.dart';
import 'package:grow_up/tacker/workout_t.dart';

class MTab extends StatefulWidget {
  const MTab({super.key});

  @override
  State<MTab> createState() => _MTabState();
}

class _MTabState extends State<MTab> {
  int selectTab = 0;
  PageStorageBucket pageCollector = PageStorageBucket();
  Widget currentTab = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: pageCollector, child: currentTab),
      backgroundColor: TableColor.white,
      bottomNavigationBar: BottomAppBar(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(235, 249, 247, 248),
                boxShadow: [
                  BoxShadow(
                      color: TableColor.primaryColor4,
                      blurRadius: 2,
                      offset: const Offset(0, 0))
                ]),
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabB(
                  icon: "assets/img/home.png",
                  selectIcon: "assets/img/home.png",
                  onTap: () {
                    selectTab = 0;
                    currentTab = const HomeView();
                    if (mounted) {
                      setState(
                        () {},
                      );
                    }
                  },
                  isActive: selectTab == 0,
                ),
                TabB(
                  icon: "assets/img/Activity.png",
                  selectIcon: "assets/img/Activity.png",
                  onTap: () {
                    selectTab = 1;
                    currentTab = const Selectview();
                    if (mounted) {
                      setState(
                        () {},
                      );
                    }
                  },
                  isActive: selectTab == 1,
                ),
                TabB(
                  icon: "assets/img/Camera.png",
                  selectIcon: "assets/img/Camera.png",
                  onTap: () {
                    selectTab = 2;
                    currentTab = const Progress();
                    if (mounted) {
                      setState(
                        () {},
                      );
                    }
                  },
                  isActive: selectTab == 2,
                ),
                TabB(
                  icon: "assets/img/Profile.png",
                  selectIcon: "assets/img/Profile.png",
                  onTap: () {
                    selectTab = 3;
                    currentTab = const PView();

                    if (mounted) {
                      setState(
                        () {},
                      );
                    }
                  },
                  isActive: selectTab == 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
