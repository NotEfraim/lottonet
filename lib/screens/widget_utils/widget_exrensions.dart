import 'package:flutter/material.dart';

Widget commonRoundedButton(
    {double? height,
    double? width,
    required Color backgroundColor,
    required Color textColor,
    required String text,
    required Function() onClick}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: () {
        onClick();
      },
    ),
  );
}
