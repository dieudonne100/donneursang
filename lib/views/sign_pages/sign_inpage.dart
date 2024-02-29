import 'package:donneursang/core/commons/button.dart';
import 'package:donneursang/core/commons/footer.dart';
import 'package:donneursang/views/auth/pages/login_page.dart';
import 'package:donneursang/views/sign_pages/widgets/forgot_pwd_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/commons/text_field_input.dart';
import '../../core/constants/themes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool loading = false;
  bool passwordsMatch = false;
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            const Gap(15),
            TextFieldInput(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              onLongPressDown: (value) {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              onLongPressUp: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              coloricons: Colors.black26,
              fontWeight: FontWeight.w300,
              iconData: showPassword ? Icons.visibility_off : Icons.visibility,
              controller: _passwordController,
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
      InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BottomBar()));
          },
          child: button(
            backgroundColor: kPrimaryColor,
            colorText: kWhiteColor,
            title: "Log In",
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account?'),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16),
              )),
        ],
      ),
    ])));
  }
}
