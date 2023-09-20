import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/bottom_navigator.dart';
import 'package:health_app/constants/custom_button.dart';
import 'package:health_app/constants/custom_dropdown.dart';
import 'package:health_app/constants/statesandcity.dart';
import 'package:http/http.dart' as http;

import '../constants/textformfield.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedState = '';
  String selectedCity = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> sendRegistrationRequest({
    required String email,
    required String name,
    required String age,
    required String gender,
    required String state,
    required String password,
  }) async {
    final Uri registrationUrl = Uri.parse('https://sih.shreeraj.me/register');

    final Map<dynamic, dynamic> registrationData = {
      'email': email,
      'name': name,
      'age': age,
      'gender': gender,
      'state': state,
      'passwd': password,
    };

    try {
      final response = await http.post(
        registrationUrl,
        body: registrationData,
      );

      print("this ${response.body}");
      if (response.statusCode == 200) {
        // Registration successful, handle the response here.
        // You can navigate to the next screen or perform any necessary actions.
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserBottomNav(),
            ));
      } else {
        final errorMessage = json.decode(response.body)['error'];
        print(errorMessage);
        // Registration failed, handle error or show an error message.
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request.
      print('Error: $e');
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(
                  top: size.height * 0.015,
                  bottom: size.height * 0.015,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.025),
                width: size.width * 0.9,
                height: size.height * 0.87,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(spreadRadius: 10, color: Colors.lightBlue),
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 133, 195, 223),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                style: GoogleFonts.inter(
                                  fontSize: 24.0,
                                  color: const Color(0xFF21899C),
                                  letterSpacing: 2.0,
                                ),
                                children: const [
                                  TextSpan(
                                      text: 'REGI',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800)),
                                  TextSpan(
                                      text: 'STER',
                                      style: TextStyle(
                                          color: Color(0xFFFE9879),
                                          fontWeight: FontWeight.w800)),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 14,
                        child: CustomTextField(
                          controller: nameController,
                          hintText: 'Enter Your Name',
                          pIcon: Icon(Icons.person,
                              color: const Color(0xFF151624).withOpacity(0.5),
                              size: 16),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          tType: TextInputType.text,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: size.height / 14,
                        child: CustomTextField(
                          controller: ageController,
                          hintText: 'Enter Your Age',
                          pIcon: Icon(Icons.calendar_today,
                              color: const Color(0xFF151624).withOpacity(0.5),
                              size: 16),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                          tType: TextInputType.number,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: size.height / 14,
                        child: CustomTextField(
                          controller: emailController,
                          hintText: 'Enter Your Email',
                          pIcon: Icon(Icons.email,
                              color: const Color(0xFF151624).withOpacity(0.5),
                              size: 16),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // You can add more email validation logic here if needed.
                            return null;
                          },
                          tType: TextInputType.emailAddress,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: size.height / 14,
                        child: CustomDropdownFormField<String?>(
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
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: size.height / 14,
                        child: CustomDropdownFormField<String?>(
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
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: size.height / 14,
                        child: CustomTextField(
                          controller: passwordController,
                          hintText: 'Enter Your Password',
                          pIcon: Icon(Icons.lock_outline_rounded,
                              color: const Color(0xFF151624).withOpacity(0.5),
                              size: 16),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // You can add more password validation logic here if needed.
                            return null;
                          },
                          tType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: size.height / 14,
                        child: CustomTextField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm Your Password',
                          pIcon: Icon(Icons.lock_outline_rounded,
                              color: const Color(0xFF151624).withOpacity(0.5),
                              size: 16),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            // You can add more validation logic here to ensure it matches the password.
                            return null;
                          },
                          tType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 24),
                      CustomButton(
                          size: size,
                          buttontext: "Sign-In",
                          onpressed: () {
                            // try {
                            if (_formKey.currentState!.validate()) {
                              // All fields are valid, you can proceed with registration
                              // You can access the user's input using the controllers
                              String name = nameController.text;
                              String ageText = ageController.text;
                              int ages = 18; // Default to 0 if parsing fails
                              String email = emailController.text;
                              String state = selectedState;
                              String city = selectedCity;
                              String password = passwordController.text;

                              // Implement registration logic here
                              // For example, send data to your backend or perform local registration
                              sendRegistrationRequest(
                                  email: email,
                                  name: name,
                                  password: password,
                                  age: ageText,
                                  gender: "male",
                                  state: state);
                              // Reset form after registration
                              _formKey.currentState!.reset();
                              selectedState = '';
                              selectedCity = '';
                            } else {
                              print("hi");
                            }
                            // } catch (e) {
                            //   print('Error: $e');
                            // }
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
