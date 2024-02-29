import 'package:donneursang/views/sign_pages/sign_inpage.dart';
import 'package:donneursang/views/success/success_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/commons/button.dart';
import '../../core/constants/themes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final TextEditingController _fullnameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool loading = false;
  bool passwordsMatch = false;

  // File? _image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/acceuil.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Gap(30),
                  const Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: AppTheme.kTitle,
                  ),
                  const Gap(5),
                  const Text(
                    "You can enter your information to create an account",
                    textAlign: TextAlign.center,
                    style: AppTheme.kSubTitle,
                  ),
                  const Gap(20),
                  // GestureDetector(
                  //   onTap: selectImage,
                  //   child: SizedBox(
                  //     width: 100,
                  //     height: 100,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(90),
                  //       child: profileWidget(image: _image),
                  //     ),
                  //   ),
                  // ),
                  const Gap(20),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // SignUpForm(
                        //   onEdit: () {
                        //     setState(() {});
                        //   },
                        // ),
                        const Gap(30),
                        InkWell(
                            onTap: formKey.currentState != null &&
                                    formKey.currentState!.validate()
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const SuccessPage())));
                                  }
                                : null,
                            child: button(
                              backgroundColor: kPrimaryColor,
                              colorText: kWhiteColor,
                              title: "Sign Up",
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInPage()));
                              },
                              child: const Text(
                                'LogIn',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
