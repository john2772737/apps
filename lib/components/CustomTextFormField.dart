import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.60, // 55% of the screen width
      height: screenHeight * 0.085, // Adjust height as needed
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(
          color: Colors.black, // Foreground text color black
          fontFamily: 'LeagueSpartan', // Use League Spartan font
          fontSize: 12, // Correct font size
          fontWeight: FontWeight.w900, // Correct font weight
        ),
        decoration: InputDecoration(
          labelText: label, // Label for the text field
          labelStyle: TextStyle(
            color: Colors.black, // Text color for the label
            fontFamily: 'LeagueSpartan',
            fontSize: 12, // Label text font size
            fontWeight: FontWeight.w900, // Correct label font weight
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never, // Remove animation and keep the label static
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color(0xFFAD7BE9), // Outline color violet
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFAD7BE9), // Focused border color violet
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: Color(0xFFAD7BE9), // Default border color violet
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Color(0xFFF5F5F7),
          contentPadding: EdgeInsets.symmetric(horizontal: 15), // Adjust padding
          suffixIcon: obscureText
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {},
                )
              : null,
        ),
      ),
    );
  }
}
