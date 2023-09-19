import 'package:flutter/material.dart';
import 'package:health_app/Screens/Register_Screen.dart';
import 'package:health_app/bottom_navigator.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Back!"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/main-bg.jpg"),
            fit: BoxFit.cover,
          ),),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                      icon: Icon(Icons.email_outlined,color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Email ID',
                      hintText: 'Enter registered email id'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                      icon: Icon(Icons.password,color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Password',
                      hintText: 'Enter Your Password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     //TODO FORGOT PASSWORD SCREEN GOES HERE
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => UserBottomNav(),));
              //   },
              //   child: Container(
              //     child: Text(
              //       'Forgot Password?',
              //       style: TextStyle(color: Colors.blue, fontSize: 15),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ))),
                  onPressed: () async {
                    // try {
                    //   final user = await _auth.signInWithEmailAndPassword(
                    //       email: email, password: password);
                    //   if (user != null) {
                    //     // getCurrentUser();
                    //     // Navigator.of(context).push(
                    //     //   MaterialPageRoute(
                    //     //       builder: (_) => ProcessData("Player")),
                    //     // );
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   }
                    // } catch (e) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text(e.toString()),
                    //     ),
                    //   );
                    // }
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserBottomNav(),));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterDemo(),));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white
                  )
                ),
                child: const Text(
                  'New to Health App? Create Account',
                  style: TextStyle(
                      color: Colors.lightBlueAccent, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}