import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/views/auth/controller/login_controller.dart';
import 'package:donneursang/views/auth/pages/register_page.dart';
import 'package:donneursang/views/sign_pages/widgets/forgot_pwd_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../core/commons/text_field_input.dart';
import '../../core/constants/themes.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool loading = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginController = ref.read(loginControllerProvider);

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
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
              text: 'Welcome Back 👋 to',
              style: AppTheme.kTitle,
              children: <TextSpan>[
                TextSpan(
                  text: ' Blood Search',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
        ),
        const Gap(10),
        const Text(
          "Hello there, login to continue",
          textAlign: TextAlign.center,
          style: AppTheme.kSubTitle,
        ),
        const Gap(20),
        TextFieldInput(
          iconData: Icons.email,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(221, 218, 218, 1),
          controller: loginController.emailController,
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
        const Gap(15),
        TextFieldInput(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          coloricons: Colors.black26,
          fontWeight: FontWeight.w300,
          iconData: showPassword ? Icons.visibility_off : Icons.visibility,
          controller: loginController.passController,
          label: "Mot de passe",
          hint: "******",
          isPassword: showPassword,
          validator: (value) {
            if (value == "") {
              return "Le mot de passe ne doit pas être vide";
            } else {
              return null;
            }
          },
          onChanged: (value) {
            setState(() {});
          },
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPwdView()));
              },
              child: const Text(
                "Forgot Password ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w300,
                    fontSize: 14),
              ),
            ),
          ],
        )
      ],
    ),
          ),
          const Gap(50),
          Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: CustomButton(
      isFullWidth: true,
      color: kPrimaryColor,
      isDisabled: loginController.emailController.text.isEmpty ||
          loginController.passController.text.isEmpty,
      onPressed: () async {
        try {
          loading = true;
          setState(() {});
          await ref
              .read(loginControllerProvider)
              .signInUser(context: context);
        } catch (e) {
          e;
        } finally {
          loading = false;
          setState(() {});
        }
      },
      loading: loading,
      text: 'CONNECTER',
    ),
          ),
          Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Already have an account?'),
      TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignUpPage()));
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(fontSize: 16),
          )),
    ],
          ),
        ]));
  }
}
