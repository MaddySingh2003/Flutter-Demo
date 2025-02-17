import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/c_widgets/c_textfield.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/common/r_button.dart';
import 'package:grow_up/screens/home/login/login_p.dart';
import 'package:grow_up/screens/home/login/profile.dart';

class SignUpSc extends StatefulWidget {
  const SignUpSc({super.key});

  @override
  State<SignUpSc> createState() => _SignUpScState();
}

class _SignUpScState extends State<SignUpSc> {
  bool isCheck = false;
  bool isLoding = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  createAUer() async {
    try {
      setState(() {
        isLoding = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

      setState(() {
        isLoding = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoding = false;
      });
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Weak Password!.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('This Email Is In Use!.'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoding = false;
      });
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something Is Wrong Try Again!.'),
        ),
      );
    }
  }

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
                  "Create An Account ",
                  style: TextStyle(
                    color: TableColor.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Let's Start! ",
                  style: TextStyle(
                    color: TableColor.gray,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                const CTextfield(
                  hintText: "FIRST NAME.",
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const CTextfield(
                  hintText: "LAST NAME.",
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                CTextfield(
                  hintText: "EMAIL.",
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                CTextfield(
                  hintText: "PASSWORD.",
                  controller: _password,
                  obsecureText: true,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: TableColor.gray,
                      ),
                    ),
                    Text(
                      "By continuing you accept our Privacy Policy and\n Term of Use.  ",
                      style: TextStyle(
                        color: TableColor.gray,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.4,
                ),
                RButton(
                    title: "Register",
                    onPressed: () {
                      createAUer();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CProfile(),
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
                        builder: (context) => const LoginP(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have account? ",
                        style: TextStyle(
                          color: TableColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        " Login.",
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
