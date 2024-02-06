import 'package:flutter/material.dart';

class Donor {
  final String image, title, subtitle, startimage;
  final IconData icon;

  Donor(
      {required this.startimage,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.icon});
}
