import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildCard(size),
                buildFooter(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(Size size) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: size.width * 0.9,
      height: size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/logo2.svg', height: size.height / 8, width: size.height / 8),
                  SizedBox(height: size.height * 0.03),
                  Text.rich(
                    TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 24.0,
                        color: const Color(0xFF21899C),
                        letterSpacing: 2.0,
                      ),
                      children: const [
                        TextSpan(text: 'LOGIN', style: TextStyle(fontWeight: FontWeight.w800)),
                        TextSpan(text: 'PAGE', style: TextStyle(color: Color(0xFFFE9879), fontWeight: FontWeight.w800)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildEmailFormField(size),
                  SizedBox(height: size.height * 0.02),
                  buildPasswordFormField(size),
                  SizedBox(height: size.height * 0.01),
                  buildRememberMeSection(size),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  signInButton(size),
                  SizedBox(height: size.height * 0.02),
                  buildNoAccountText(),
                  SizedBox(height: size.height * 0.02),
                  google_facebookButton(size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmailFormField(Size size) {
    return SizedBox(
      height: size.height / 12,
      child: TextFormField(
        controller: emailController,
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter Your email',
          hintStyle: GoogleFonts.inter(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          fillColor: emailController.text.isNotEmpty ? Colors.transparent : const Color.fromRGBO(248, 247, 251, 1),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: emailController.text.isEmpty ? Colors.transparent : const Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          prefixIcon: Icon(Icons.email, color: const Color(0xFF151624).withOpacity(0.5), size: 16),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: emailController.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          // You can add more email validation logic here if needed.
          return null;
        },
      ),
    );
  }

  Widget buildPasswordFormField(Size size) {
    return SizedBox(
      height: size.height / 12,
      child: TextFormField(
        controller: passController,
        style: GoogleFonts.inter(
          fontSize: 18.0,
          color: const Color(0xFF151624),
        ),
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        cursorColor: const Color(0xFF151624),
        decoration: InputDecoration(
          hintText: 'Enter Your Password',
          hintStyle: GoogleFonts.inter(
            fontSize: 16.0,
            color: const Color(0xFF151624).withOpacity(0.5),
          ),
          fillColor: passController.text.isNotEmpty ? Colors.transparent : const Color.fromRGBO(248, 247, 251, 1),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: passController.text.isEmpty ? Colors.transparent : const Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Color.fromRGBO(44, 185, 176, 1),
            ),
          ),
          prefixIcon: Icon(Icons.lock_outline_rounded, color: const Color(0xFF151624).withOpacity(0.5), size: 16),
          suffix: Container(
            alignment: Alignment.center,
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color.fromRGBO(44, 185, 176, 1),
            ),
            child: passController.text.isEmpty
                ? const Center()
                : const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 13,
                  ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          // You can add more password validation logic here if needed.
          return null;
        },
      ),
    );
  }

  Widget buildRememberMeSection(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Checkbox(
              value: rememberMe,
              activeColor: const Color(0xFF21899C),
              onChanged: (value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            ),
            Text(
              'Remember Me',
              style: GoogleFonts.inter(fontSize: 16.0, color: const Color(0xFF151624).withOpacity(0.5)),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Implement forgot password functionality here.
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.inter(fontSize: 14.0, color: const Color(0xFF21899C)),
          ),
        ),
      ],
    );
  }

  Widget signInButton(Size size) {
    return SizedBox(
      height: size.height / 13,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement sign-in logic here.
          if (_formKey.currentState!.validate()) {
            // Form is valid, perform the sign-in action.
            // You can access emailController.text and passController.text here.
          }
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF21899C),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text(
          'Sign in',
          style: GoogleFonts.inter(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget buildNoAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Divider(color: const Color(0xFF969AA8)),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'Don’t Have Account?',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.0,
              color: const Color(0xFF969AA8),
              fontWeight: FontWeight.w500,
              height: 1.67,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Divider(color: const Color(0xFF969AA8)),
        ),
      ],
    );
  }

  Widget google_facebookButton(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Google button
        TextButton(
          onPressed: (){},
          child: Container(
            alignment: Alignment.center,
            width: size.width / 2.8,
            height: size.height / 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: const Color(0xFFEA4335)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 24.0,
                  height: 24.0,
                  color: const Color(0xFFC4C4C4).withOpacity(0.0),
                  child: SvgPicture.asset(
                    'assets/google_logo.svg',
                    height: 16,
                    width: 16,
                    color: const Color(0xFFEA4335),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'Google',
                  style: GoogleFonts.inter(fontSize: 14.0, color: const Color(0xFFEA4335)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16),

        // Facebook button
        TextButton(
          onPressed: (){},
          child: Container(
            alignment: Alignment.center,
            width: size.width / 2.8,
            height: size.height / 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: const Color(0xFF4285F4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 24.0,
                  height: 24.0,
                  color: const Color(0xFFC4C4C4).withOpacity(0.0),
                  child: SvgPicture.asset(
                    'assets/facebook_logo.svg',
                    height: 16,
                    width: 16,
                    color: const Color(0xFF4285F4),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'Facebook',
                  style: GoogleFonts.inter(fontSize: 14.0, color: const Color(0xFF4285F4)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFooter(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: Text.rich(
        TextSpan(
          style: GoogleFonts.inter(fontSize: 12.0, color: Colors.black),
          children: const [
            TextSpan(text: 'Don’t have an account? ', style: TextStyle(fontWeight: FontWeight.w500)),
            TextSpan(text: 'Sign Up here', style: TextStyle(color: Color(0xFFFF7248), fontWeight: FontWeight.w500)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
