import 'package:donneursang/views/onboarding/onboarding3_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/themes.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String text;
  final String image;
  const OnboardingWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
          top: 16,
          right: 16,
            child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnboardingPage3()));
          },
          child: const Text(
            'Skip',
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(58, 67, 81, 1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400),
          ),
        )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(100),
                Image.asset(
                  image,
                  height: 265,
                  width: 280,
                ),
                const Gap(64),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTheme.kTitle,
                ),
                const Gap(16),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTheme.kSubTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
