import 'package:flutter/material.dart';
import 'package:health_app/Screens/quiz.dart';

class StartQuiz extends StatefulWidget {
  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Start Screen'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          ),),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display an image
              Image.asset(
                "assets/mental-icon.png", // Replace with your image file path
                width: 200.0, // Adjust the width as needed
              ),
              SizedBox(height: 20.0), // Spacer
      
              // Start button
              ElevatedButton(
                onPressed: () {
                  // Add code to handle button press (navigate to another screen, etc.)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen(),)
                  );
                },
                child: Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
