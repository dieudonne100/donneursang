import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget module({required String icon, required String title, required VoidCallback ontap}) {
  return Column(
    children: [
      GestureDetector(
        onTap: ontap,
        child: Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]),
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Poppins",
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
