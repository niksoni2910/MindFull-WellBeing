import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_app/Screens/login_screen.dart';
import 'package:health_app/Screens/quiz.dart';
import 'package:health_app/Screens/register_screen.dart';
import 'package:health_app/bottom_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RegistrationPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/2703664.png',
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
