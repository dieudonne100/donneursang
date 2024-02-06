import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(222, 10, 30, 1);
const kTitleColor = Color.fromRGBO(39, 42, 47, 1);
const kSubtitle = Color.fromRGBO(39, 42, 47, 0.56);
const kWhiteColor = Colors.white;
const kBlackColor = Color.fromRGBO(0, 0, 0, 1);

class AppTheme {
  static const kTitle = TextStyle(
    color: kTitleColor,
    fontSize: 30,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const kSubTitle = TextStyle(
    color: kSubtitle,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
  );

  
}
