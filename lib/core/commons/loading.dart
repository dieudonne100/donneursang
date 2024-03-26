import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';

Container circularLoading() {
  return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10.0),
      child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(kPrimaryColor),
      ));
}
