import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/Screens/auth/login_screen.dart';
import 'package:health_app/Screens/graph.dart';
import 'package:health_app/Screens/group/pages/home_page.dart';
import 'package:health_app/Screens/profile/edit_profile.dart';
import 'package:health_app/constants/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Simulated user data for demonstration purposes// Replace with user's age

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
                  builder: (context) => const LoginScreen(),
                ),
              );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Add a logout icon here
            onPressed: () {
              // Implement logout functionality
              _onBackPressed();
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    UserProfileCard(
                      onEditProfile: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                      },
                    ),

                    // ... Other sections (Screening History, Progress Tracker, Recommendations) ...
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfileCard extends StatelessWidget {
  final VoidCallback? onEditProfile;

  UserProfileCard({super.key, 
    this.onEditProfile,
  });
  double a = map['age'];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User Profile Picture (optional)

            const SizedBox(height: 16.0),
            // User Name
            Text(
              map['name']!,
              style: GoogleFonts.roboto(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Custom text color
              ),
            ),
            const SizedBox(height: 8.0),
            // User Email
            Text(
              map['email'],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 32.0,
            ),
            // User State
            ListTile(
              leading: const Icon(
                Icons.location_on, // Custom icon
                color: Colors.blue,
              ),
              title: const Text(
                'State',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                map['state'],
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            // User City
            ListTile(
              leading: Icon(
                map['gender'] == "male"
                    ? Icons.male_rounded
                    : Icons.female_rounded, // Custom icon
                color: Colors.blue,
              ),
              title: const Text(
                'Gender',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                map['gender'],
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            // User Age
            ListTile(
              leading: const Icon(
                Icons.cake, // Custom icon
                color: Colors.blue,
              ),
              title: const Text(
                'Age',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                '$a years',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Edit Profile Button
            if (onEditProfile != null)
              ElevatedButton(
                onPressed: onEditProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Custom button color
                ),
                child: const Text('Edit Profile'),
              ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GroupHomePage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Custom button color
              ),
              child: const Text('Group Chat'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MultiLineGraphPage(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Custom button color
              ),
              child: const Text('View History'),
            ),
          ],
        ),
      ),
    );
  }
}
