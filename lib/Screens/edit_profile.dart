import 'package:flutter/material.dart';
import 'package:health_app/constants/custom_button.dart';
import 'package:health_app/constants/custom_dropdown.dart';
import 'package:health_app/constants/textformfield.dart';

import '../constants/statesandcity.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController(text: "Akshay");
  TextEditingController _ageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String selectedState = 'Maharashtra';
  String selectedCity = 'Mumbai';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        // Gradient Background

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFF6BB9F0)],
            ),
          ),
        ),
        // Mental Health Icon
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width / 2 - 50,
          child: Icon(
            Icons.favorite,
            size: 100,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
        // Registration Form
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back), // Replace with your desired icon
                onPressed: () {
                  // Add the functionality to close the screen here
                  Navigator.of(context).pop();
                },
              ),
              Text(
                '  Edit Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors
                      .blue.shade900, // Adjust the color to match your gradient
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFormFieldEditProfile(
                            controller: _nameController,
                            pIcon: Icon(Icons.person),
                            tType: TextInputType.text,
                            obscureText: false,
                            labletext: 'Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return '';
                            },
                          ),
                          SizedBox(height: 16),
                          CustomTextFormFieldEditProfile(
                            controller: _ageController,
                            pIcon: Icon(Icons.calendar_today),
                            tType: TextInputType.number,
                            obscureText: false,
                            labletext: 'Age',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your age';
                              }
                              // You can add more age validation logic here if needed.
                              return '';
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: size.height / 14,
                            child: CustomDropdownFormFieldEditProfile<String?>(
                              selectedValue:
                                  selectedState.isNotEmpty ? selectedState : null,
                              items: StatesAndCiti.states,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedState = newValue ?? '';
                                  selectedCity = 'Select City';
                                });
                              },
                              labelText: 'State',
                              validator: (value) {
                                if (value == 'Select State') {
                                  return 'Please select a state';
                                }
                                return null;
                              },
                              pIcon: Icon(Icons.location_pin),
                            ),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            height: size.height / 14,
                            child: CustomDropdownFormFieldEditProfile<String?>(
                              selectedValue:
                                  selectedCity.isNotEmpty ? selectedCity : null,
                              items: StatesAndCiti.cities[selectedState] ?? [],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCity = newValue ?? '';
                                });
                              },
                              labelText: 'City',
                              validator: (value) {
                                if (value == 'Select City') {
                                  return 'Please select a city';
                                }
                                return null;
                              },
                              pIcon: Icon(Icons.location_city),
                            ),
                          ),
                          SizedBox(height: 16),
                          CustomTextFormFieldEditProfile(
                            controller: _passwordController,
                            pIcon: Icon(Icons.lock),
                            tType: TextInputType.text,
                            obscureText: true,
                            labletext: 'Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              // You can add more password validation logic here if needed.
                              return '';
                            },
                          ),
                          SizedBox(height: 16),
                          CustomTextFormFieldEditProfile(
                            controller: _confirmPasswordController,
                            pIcon: Icon(Icons.lock),
                            tType: TextInputType.text,
                            obscureText: true,
                            labletext: 'Confirm Password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return '';
                            },
                          ),
                          SizedBox(height: 32),
                          CustomButton(
                            formKey: _formKey,
                            size: MediaQuery.sizeOf(context) * 0.8,
                            buttontext: "Save",
                            onpressed: () {
                              // Implement registration logic here
                              if (_formKey.currentState!.validate()) {
                                // All fields are valid, you can perform your action here.
                                String name = _nameController.text;
                                int age = int.tryParse(_ageController.text) ?? 0;
                                String password = _passwordController.text;
                                // Now you can use these values as needed.
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
