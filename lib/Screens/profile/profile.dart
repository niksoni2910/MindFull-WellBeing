import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/Screens/auth/login_screen.dart';
import 'package:health_app/Screens/profile/edit_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Simulated user data for demonstration purposes
  final String userName = "Akshay Potkhule";
  final String userEmail = "Akshaypotkhule123@example.com";
  final String userState = "Maharastra"; // Replace with user's state
  final String userCity = "Mumbai"; // Replace with user's city
  final int userAge = 30; // Replace with user's age
  Future<bool> _onBackPressed() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        title: const Text(
          'Do you want to Log out..?',
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
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
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

  // ... Other member variables and methods ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Add a logout icon here
            onPressed: () {
              // Implement logout functionality
              _onBackPressed();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // User Information Card
            UserProfileCard(
              userName: userName,
              userEmail: userEmail,
              userState: userState,
              userCity: userCity,
              userAge: userAge,
              onEditProfile: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ));
              },
            ),

            // ... Other sections (Screening History, Progress Tracker, Recommendations) ...
          ],
        ),
      ),
    );
  }
}

class UserProfileCard extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userState;
  final String userCity;
  final int userAge;
  final VoidCallback? onEditProfile;

  UserProfileCard({
    required this.userName,
    required this.userEmail,
    required this.userState,
    required this.userCity,
    required this.userAge,
    this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Picture (optional)

            SizedBox(height: 16.0),
            // User Name
            Text(
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // User Email
            Text(
              userEmail,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 32.0,
            ),
            // User State
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('State'),
              subtitle: Text(userState),
            ),
            // User City
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('City'),
              subtitle: Text(userCity),
            ),
            // User Age
            ListTile(
              leading: Icon(Icons.cake),
              title: Text('Age'),
              subtitle: Text('$userAge years'),
            ),
            SizedBox(height: 16.0),
            // Edit Profile Button
            if (onEditProfile != null)
              ElevatedButton(
                onPressed: onEditProfile,
                child: Text('Edit Profile'),
              ),
          ],
        ),
      ),
    );
  }
}
