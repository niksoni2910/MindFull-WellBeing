import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/Screens/blog.dart';
import 'package:health_app/Screens/profile/profile.dart';
import 'package:health_app/Screens/quiz/start_quiz_screen.dart';
import 'package:health_app/Screens/remedies/remedies.dart';
import 'package:health_app/Screens/workout/workout_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class UserBottomNav extends StatefulWidget {
  const UserBottomNav({super.key});

  @override
  State<UserBottomNav> createState() => _UserBottomNavState();
}

class _UserBottomNavState extends State<UserBottomNav> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const StartQuiz(),
    const Blog2(),
    const Workout(),
    const RemediesPage(),
    const UserProfile(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onBackPressed() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        title: const Text(
          'Do you want to exit..?',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        actions: <Widget>[
          CloseButton(
            onPressed: () => Navigator.of(context).pop(false),
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () async {
              await SystemNavigator.pop();
            },
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    ).then((value) =>
        value ?? false); // Ensure to return false if the dialog is dismissed
  }

  @override
  void didChangeDependencies() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: 5,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.blue : Colors.grey;
            IconData iconData = Icons.quiz; // Default value
            String label = 'Quiz'; 

            switch (index) {
              case 0:
                iconData = Icons.quiz;
                label = 'Quiz';
                break;
              case 1:
                iconData = Icons.info;
                label = 'Blogs';
                break;
              case 2:
                iconData = Icons.fitness_center;
                label = 'Workout';
                break;
              case 3:
                iconData = Icons.health_and_safety;
                label = 'Remedies';
                break;
              case 4:
                iconData = CupertinoIcons.profile_circled;
                label = 'Profile';
                break;
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: color,
                ),
                Text(
                  label,
                  style: TextStyle(color: color),
                ),
              ],
            );
          },
          activeIndex: _currentIndex,
          splashColor: Colors.blue,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: onTappedBar,
        ),
      ),
    );
  }
}

