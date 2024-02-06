import 'package:donneursang/views/otpView/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/commons/button.dart';
import '../../../core/commons/text_field_input.dart';
import '../../../core/constants/themes.dart';

class ForgotPwdView extends StatefulWidget {
  const ForgotPwdView({super.key});

  @override
  State<ForgotPwdView> createState() => _ForgotPwdViewState();
}

class _ForgotPwdViewState extends State<ForgotPwdView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/logoRouge.png',
                height: 180,
              ),
              const SizedBox(height: 20),
              const Text(
                "Your password reset will be send in your registered email address.",
                textAlign: TextAlign.center,
                style: AppTheme.kSubTitle,
              ),
              const Gap(40),
              TextFieldInput(
                iconData: Icons.email,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(221, 218, 218, 1),
                controller: _emailController,
                hint: "sama@gmail.com",
                validator: (value) {
                  if (value == "") {
                    return "L'émail ne doit pas être vide";
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value!)) {
                    return "Cet email n'est pas valide";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const Gap(250),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OTPView()));
            },
            child: button(
              backgroundColor: kPrimaryColor,
              colorText: kWhiteColor,
              title: "Reset",
            )),
      ]),
    );
  }
}
