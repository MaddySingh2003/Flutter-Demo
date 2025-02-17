import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/c_textfield.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/screens/home/login/goalset.dart';

class CProfile extends StatefulWidget {
  const CProfile({super.key});

  @override
  State<CProfile> createState() => _CProfileState();
}

class _CProfileState extends State<CProfile> {
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtW = TextEditingController();
  TextEditingController txtH = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/on_1.png"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                // Image.asset(
                //   "assets/img/on_1.png",
                //   width: media.width,
                //   fit: BoxFit.fitWidth,
                // ),
                SizedBox(
                  height: media.width * 0.50,
                ),
                Text(
                  "Let's Make Your Profile!  ",
                  style: TextStyle(
                    color: TableColor.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: TableColor.lightGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                "assets/img/icon1.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: TableColor.gray,
                              ),
                            ),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: ["Male", "Femaal"]
                                      .map((name) => DropdownMenuItem(
                                            value: name,
                                            child: Text(
                                              name,
                                              style: TextStyle(
                                                color: TableColor.gray,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {},
                                  isExpanded: true,
                                  hint: Text(
                                    "Choose Gender",
                                    style: TextStyle(
                                      color: TableColor.gray,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      CTextfield(
                        controller: txtDate,
                        hintText: "Date Of Birth.",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CTextfield(
                              controller: txtW,
                              hintText: "Your Weight.",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: TableColor.secondry),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style: TextStyle(
                                color: TableColor.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CTextfield(
                              controller: txtH,
                              hintText: "Your Height.",
                              
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: TableColor.secondry),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style: TextStyle(
                                color: TableColor.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.2,
                      ),
                      RButton(
                          title: "Next >",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Goalset(),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
