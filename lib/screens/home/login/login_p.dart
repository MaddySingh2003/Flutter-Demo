import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/c_textfield.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/screens/home/login/signup_sc.dart';
import 'package:grow_up/screens/home/login/w_screen.dart';

class LoginP extends StatefulWidget {
  const LoginP({super.key});

  @override
  State<LoginP> createState() => _LoginPState();
}

class _LoginPState extends State<LoginP> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginU();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginU extends StatefulWidget {
  const LoginU({super.key});

  @override
  State<LoginU> createState() => _LoginUState();
}

class _LoginUState extends State<LoginU> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TableColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back! ",
                  style: TextStyle(
                    color: TableColor.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Let's Get In.",
                  style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                const CTextfield(
                  hintText: "EMAIL.",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const CTextfield(
                  hintText: "PASSWORD.",
                  obsecureText: true,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Forgot Password?  ",
                        style: TextStyle(
                          color: TableColor.gray,
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.7,
                ),
                RButton(
                    title: "Log In.",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WScreen(),
                        ),
                      );
                    }),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TableColor.gray.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "Or",
                      style: TextStyle(color: TableColor.black, fontSize: 14),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: TableColor.gray.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: TableColor.black,
                            border: Border.all(
                              width: 1,
                              color: TableColor.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          "assets/img/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: media.width * 0.04,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: TableColor.black,
                            border: Border.all(
                              width: 1,
                              color: TableColor.gray.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          "assets/img/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpSc(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an accout yet?  ",
                        style: TextStyle(
                          color: TableColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Register Now!",
                        style: TextStyle(
                            color: TableColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
