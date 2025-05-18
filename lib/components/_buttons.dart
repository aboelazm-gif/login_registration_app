import 'package:flutter/material.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class buttonWidget extends StatelessWidget {
  final String txt;
  final double width;
  final double height;
  final VoidCallback OnPressed;
  const buttonWidget(
      {required this.txt,
      required this.width,
      required this.height,
      required this.OnPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: OnPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBGColor,
        fixedSize: Size(width, height),
      ),
      child: Text(
        txt,
        style: TextStyle(
          fontFamily: 'Bukhari',
          fontSize: 25,
          color: buttonTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
