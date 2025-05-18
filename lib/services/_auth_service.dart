import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_registration_app/screens/_homePage.dart';

class AuthService {
  // This class is responsible for handling authentication-related tasks.
  // It can include methods for login, logout, and checking authentication status.
  // For example:
  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(Duration(milliseconds: 500));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      String message = "";
      if (e.code == 'wrong-password') {
        // Handle wrong password error
        message = "The password provided is wrong.";
      } else if (e.code == 'email-already-in-use') {
        // Handle email already in use error
        message = "User not found.";
      } else if (e.code == 'invalid-email')
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0,
        );
    } catch (e) {
      // Handle any errors that occur during sign-up
    }
  }

  Future<void> signup({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(Duration(milliseconds: 500));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      String message = "";
      if (e.code == 'weak-password') {
        // Handle weak password error
        message = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        // Handle email already in use error
        message = "The account already exists for that email.";
      } else if (e.code == 'invalid-email') {
        // Handle invalid email error
        message = "The email address is not valid.";
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      // Handle any errors that occur during sign-up
    }
  }

  bool isAuthenticated() {
    // Logic to check if the user is authenticated
    return false; // Placeholder return value
  }
}
