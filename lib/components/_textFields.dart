import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  bool ObscureText;
  final bool isPasswordField;
  final TextEditingController? Controller;
  TextFieldWidget({
    super.key,
    required this.hint,
    required this.ObscureText,
    this.Controller,
    required this.isPasswordField,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.Controller,
      obscureText: widget.ObscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 15.0,
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  widget.ObscureText ? Icons.visibility : Icons.visibility_off,
                  color: appBarBG,
                ),
                onPressed: () {
                  setState(() {
                    widget.ObscureText = !widget.ObscureText;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Color.fromARGB(200, 255, 255, 255),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldOutline, width: 4.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldOutline, width: 0.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
        hintText: widget.hint,
        hintStyle: GoogleFonts.cairo(
            color: appBarBG,
            fontStyle: FontStyle.italic,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
