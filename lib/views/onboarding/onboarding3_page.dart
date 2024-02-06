import 'package:donneursang/views/sign_pages/sign_inpage.dart';
import 'package:flutter/material.dart';

import '../../core/commons/button.dart';
import '../../core/constants/themes.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/logoRouge.png',
              height: 180,
            ),
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: 'Dare',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' To ',
                      style: TextStyle(
                        color: Color.fromRGBO(89, 89, 89, 1),
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Donate',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 16),
            const Text(
              "You can donate for ones in need and request blood if you need.",
              textAlign: TextAlign.center,
              style: AppTheme.kSubTitle,
            ),
            const Spacer(),
            Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignInPage())
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: button(
                        colorText: kPrimaryColor,
                        title: "Log In",
                      ),
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignInPage())
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: button(
                        backgroundColor: kPrimaryColor,
                        colorText: kWhiteColor,
                        title: "Sign Up",
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
