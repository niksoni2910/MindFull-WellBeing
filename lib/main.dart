import 'package:flutter/material.dart';
import 'package:health_app/Screens/blog.dart';
import 'package:health_app/Screens/profile/edit_profile.dart';
import 'package:health_app/Screens/auth/login_screen.dart';
import 'package:health_app/Screens/profile/profile.dart';
import 'package:health_app/Screens/auth/register_screen.dart';
import 'package:health_app/Screens/result/result_page.dart';
import 'package:health_app/Screens/splash_screen.dart';
import 'package:health_app/bottom_navigator.dart';
import 'package:health_app/Screens/quiz/quiz.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


