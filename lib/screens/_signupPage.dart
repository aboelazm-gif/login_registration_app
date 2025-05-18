import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/components/_appBar.dart';
import 'package:login_registration_app/components/_buttons.dart';
import 'package:login_registration_app/components/_textFields.dart';
import 'package:login_registration_app/screens/_loginPage.dart';
import 'package:login_registration_app/services/_auth_service.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  bool isTapped = false;

  void handleTap() async {
    setState(() {
      isTapped = true;
    });
    await Future.delayed(Duration(milliseconds: 100));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                "Sign Up",
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
                  "Welcome to the only recipe app you will ever need!",
                  style: GoogleFonts.cairo(
                    color: commonTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 70),
              TextFieldWidget(
                hint: "Enter your name",
                ObscureText: false,
                Controller: _nameController,
                isPasswordField: false,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hint: "Enter your email",
                ObscureText: false,
                Controller: _emailController,
                isPasswordField: false,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hint: "Create password",
                ObscureText: true,
                Controller: _passwordController,
                isPasswordField: true,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hint: "Confirm password",
                ObscureText: true,
                Controller: _confirmPasswordController,
                isPasswordField: true,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.cairo(
                      color: commonTextColor,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isTapped ? Colors.orange : commonTextColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => handleTap(),
                      child: Text(
                        " Login",
                        style: GoogleFonts.cairo(
                            color: isTapped ? Colors.orange : commonTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 100),
              Center(
                child: buttonWidget(
                    txt: "Sign up",
                    width: 300,
                    height: 60,
                    OnPressed: () async {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        Fluttertoast.showToast(
                          msg: "Passwords do not match",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.SNACKBAR,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 14.0,
                        );
                      } else {
                        await AuthService().signup(
                            context: context,
                            email: _emailController.text,
                            password: _passwordController.text);
                        CollectionReference usersRef =
                            FirebaseFirestore.instance.collection('client');
                        usersRef.add({
                          'email': _emailController.text,
                          'name': _nameController.text,
                        });
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
