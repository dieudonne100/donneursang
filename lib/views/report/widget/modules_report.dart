import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget modulereport({
  required String title,
  required String subtitle,
}) {
  return Container(
    width: 80,
    height: 80,
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
    child: Center(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "Poppins",
              color: kTitleColor,
            ),
          ),
          const Gap(5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "Poppins",
              color: Color.fromRGBO(177, 177, 177, 1),
            ),
          )
        ],
      ),
    ),
  );
}
