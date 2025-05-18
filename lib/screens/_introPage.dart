import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/components/_appBar.dart';
import 'package:login_registration_app/components/_buttons.dart';
import 'package:login_registration_app/screens/_loginPage.dart';
import 'package:login_registration_app/screens/_signupPage.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Welcome to MealTime"),
      body: AnimatedBackground(
        vsync: this,
        behaviour: particleBehaviour,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("../assets/images/MealTime-removebg.png"),
              SizedBox(height: 30),
              Text(
                "First time cooking?",
                style: GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: commonTextColor,
                ),
              ),
              SizedBox(height: 10),
              buttonWidget(
                  txt: "Sign up",
                  width: 150,
                  height: 50,
                  OnPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  }),
              SizedBox(height: 25),
              Text(
                "Already have an account?",
                style: GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: commonTextColor,
                ),
              ),
              SizedBox(height: 10),
              buttonWidget(
                txt: "Login",
                width: 150,
                height: 50,
                OnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      backgroundColor: appBGColor,
    );
  }
}
