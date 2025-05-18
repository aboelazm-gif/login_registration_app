import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/components/_appBar.dart';
import 'package:login_registration_app/components/_buttons.dart';
import 'package:login_registration_app/components/_textFields.dart';
import 'package:login_registration_app/screens/_signupPage.dart';
import 'package:login_registration_app/services/_auth_service.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool _isTapped = false;

  void handleTap() async {
    setState(() {
      _isTapped = true;
    });
    await Future.delayed(Duration(milliseconds: 100));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "MealTime"),
      backgroundColor: appBGColor,
      body: AnimatedBackground(
        vsync: this,
        behaviour: particleBehaviour,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "Welcome Back!",
                style: TextStyle(
                    fontFamily: 'Bukhari',
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: pageTitleColor),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: Text(
                  "Great to see you again!",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    color: commonTextColor,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 80),
              TextFieldWidget(
                Controller: _emailController,
                hint: "Enter your email",
                ObscureText: false,
                isPasswordField: false,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                Controller: _passwordController,
                hint: "Enter your password",
                ObscureText: true,
                isPasswordField: true,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style:
                        GoogleFonts.cairo(color: commonTextColor, fontSize: 20),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _isTapped ? Colors.orange : commonTextColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => handleTap(),
                      child: Text(
                        " Sign up",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            color: _isTapped ? Colors.orange : commonTextColor,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 70),
              Center(
                child: buttonWidget(
                    txt: "Log In",
                    width: 300,
                    height: 60,
                    OnPressed: () async {
                      await AuthService().login(
                          context: context,
                          email: _emailController.text,
                          password: _passwordController.text);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
