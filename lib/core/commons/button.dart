import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';

Widget button({
 Color? backgroundColor,
  required Color colorText,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: kPrimaryColor),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: colorText,
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    ),
  );
}

Widget buttonOverline(
    {required Color backgroundColor,
    required Color colorText,
    required String title}) {
  return Container(
    height: 44,
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: backgroundColor),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: backgroundColor,
          fontFamily: "Dosis-Medium",
          fontSize: 20,
        ),
      ),
    ),
  );
}
