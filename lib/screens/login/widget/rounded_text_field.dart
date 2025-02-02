import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  const RoundedTextField(this.hintText, this.obscureText, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
    );
  }
}
