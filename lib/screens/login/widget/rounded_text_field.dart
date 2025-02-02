import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onTextChange;

  const RoundedTextField(this.hintText, this.obscureText,
      {super.key, required this.onTextChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onTextChange(value),
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
