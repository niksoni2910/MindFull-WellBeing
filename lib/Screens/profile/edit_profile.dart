import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_app/constants/custom_button.dart';
import 'package:health_app/constants/custom_dropdown.dart';
import 'package:health_app/constants/textformfield.dart';

import '../../constants/statesandcity.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String selectedState = 'Maharashtra';
  // Future<void> sendLoginRequest(String email, String password) async {
  //   final Uri loginUrl = Uri.parse('https://sih.shreeraj.me/login');

  //   final Map<String, String> loginData = {
  //     'email': email,
  //     'passwd': password,
  //   };

  //   try {
  //     final response = await http.post(
  //       loginUrl,
  //       body: loginData, // Encode the data as JSON
  //     );

  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       // Login successful, handle the response here.
  //       // You can navigate to the next screen or perform any necessary actions.
        
  //     } else {
  //       final errorMessage = json.decode(response.body)['error'];
  //       print(errorMessage);
  //     }
  //   } catch (e) {
  //     // Handle any exceptions that occur during the HTTP request.
  //     print('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
        body: SingleChildScrollView(
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
        ));
  }
}
