import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grow_up/camera/progress.dart';
import 'package:grow_up/common/color_e.dart';
import 'package:grow_up/firebase_options.dart';
import 'package:grow_up/screens/home/boarding/start_screen.dart';



void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GROW_UP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
          primaryColor: TableColor.primaryColor1, fontFamily: "Poppins"),
      home: const StartScreen(),
    );
  }
}
 