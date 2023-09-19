import 'package:flutter/material.dart';
import 'package:health_app/bottom_navigator.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:play_on/widget/button.dart';

class RegisterDemo extends StatefulWidget {
  const RegisterDemo({super.key});
  @override
  RegisterDemoState createState() => RegisterDemoState();
}

class RegisterDemoState extends State<RegisterDemo> {
  late String email;
  late String password;
  bool isspinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Play On"),
        backgroundColor: Colors.blue,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isspinner,
        child: Container(
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
                  padding: const EdgeInsets.only(bottom: 15,left: 15.0, right: 15.0,),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.person,color: Colors.white,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelText: 'Name',
                        hintText: 'Enter your name'),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,top: 15,left: 15.0, right: 15.0,),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.email_outlined,color: Colors.white,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelText: 'Email ID',
                        hintText: 'Enter your email id'),
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
                        icon: Icon(Icons.password,color: Colors.white,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelText: 'Password',
                        hintText: 'Enter Your Password'),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
                const SizedBox(
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
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ))),
                    onPressed: () async {
                      // setState(() {
                      //   isspinner = true;
                      // });
                      // try {
                      //   final newUser =
                      //       await _auth.createUserWithEmailAndPassword(
                      //           email: email, password: password);
                      //   if (newUser != null) {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => UserBottomNav(),
                      //         ));
                      //   }
                      //   isspinner = false;
                      // } catch (e) {
                      //   print(e);
                      // }
                      // setState(() {
                      //   isspinner = false;
                      // });
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserBottomNav(),
                              ));
                    },
                    // style: ButtonStyle(shape: ),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                // Divider(),
                const SizedBox(
                  height: 10,
                ),
                // SignInButton(
                //   padding: const EdgeInsets.only(right: 15, left: 15),
                //   Buttons.Google,
                //   onPressed: () {
                //     signInWithGoogle();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
