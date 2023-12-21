import 'package:flutter/material.dart';
import 'package:health_app/Screens/workout/workout_results.dart';
import 'package:shimmer/shimmer.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _BlogState();
}

class _BlogState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WorkOut'),
        ),
        body: const DropdownScreen(),
      ),
    );
  }
}

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  String selectedOption1 = 'cardio';
  String selectedOption2 = 'beginner';

  List<String> dropdownItems1 = [
    'cardio',
    'Olympic Weightlifting',
    'Plyometrics',
    'Powerlifting',
    'Strength',
    'Streching',
    'Strongman',
  ];
  List<String> dropdownItems2 = ['beginner', 'Intermediate', 'Expert'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      child: Card(
        margin: const EdgeInsets.only(right: 16, left: 16, top:30,bottom: 30),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              child: const Text(
                "Select an Activity",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                gradient:
                    const LinearGradient(colors: [Colors.purple, Colors.lightBlue]),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedOption1,
                onChanged: (newValue) {
                  setState(() {
                    selectedOption1 = newValue!;
                  });
                },
                items: dropdownItems1.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40.0),
            Shimmer.fromColors(
              baseColor: Colors.blue,
              highlightColor: Colors.lightBlueAccent,
              child: const Text(
                "Select a Level",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Spacer between dropdowns
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                gradient:
                    const LinearGradient(colors: [Colors.purple, Colors.lightBlue]),
                // color: Color.fromARGB(255, 8, 46, 214),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedOption2,
                onChanged: (newValue) {
                  setState(() {
                    selectedOption2 = newValue!;
                  });
                },
                items: dropdownItems2.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              style: const ButtonStyle(elevation: MaterialStatePropertyAll(20)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(type: selectedOption1, difficulty: selectedOption2),
                    ));
              },
              child: const Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}