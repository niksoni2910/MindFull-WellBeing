import 'package:flutter/material.dart';
import 'package:health_app/Screens/login_screen.dart';
import 'package:health_app/Screens/profile.dart';
import 'package:health_app/Screens/register_screen.dart';
import 'package:health_app/Screens/splash_screen.dart';
import 'package:health_app/bottom_navigator.dart';
import 'package:health_app/Screens/quiz.dart';

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


