import 'package:flutter/material.dart';
import 'package:health_app/Screens/profile/profile.dart';
import 'package:health_app/Screens/result/details.dart';
import 'package:health_app/Screens/result/result_page.dart';
import 'package:health_app/Screens/splash_screen.dart';
import 'package:health_app/bottom_navigator.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
