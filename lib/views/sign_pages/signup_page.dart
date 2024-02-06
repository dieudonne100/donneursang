import 'package:donneursang/views/sign_pages/sign_inpage.dart';
import 'package:donneursang/views/sign_pages/widgets/phone_widget.dart';
import 'package:donneursang/views/success/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../core/commons/button.dart';
import '../../core/commons/text_field_input.dart';
import '../../core/constants/themes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool loading = false;
  bool passwordsMatch = false;
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
                  Image.asset(
                    'assets/images/logoRouge.png',
                    height: 150,
                  ),
                  const Gap(15),
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
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldInput(
                          fontWeight: FontWeight.w300,
                          controller: _fullnameController,
                          label: "Full Name",
                          hint: "Full Name",
                          color: Colors.black26,
                          iconData: Icons.person,
                          coloricons: kPrimaryColor,
                          validator: (value) {
                            if (value == "") {
                              return "Full Name ne doit pas être vide";
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
                          fontWeight: FontWeight.w300,
                          iconData: Icons.email,
                          coloricons: kPrimaryColor,
                          color: Colors.black26,
                          controller: _emailController,
                          label: "Email",
                          hint: "sama@gmail.com",
                          validator: (value) {
                            if (value == "") {
                              return "L'émail ne doit pas être vide";
                            } else if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
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
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                            PhoneNumberFormatter(),
                          ],
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                            labelText: '6XX - XXX - XXX',
                            prefixIcon:
                                const Icon(Icons.phone, color: kPrimaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: kPrimaryColor,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: kPrimaryColor,
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: kPrimaryColor,
                                )),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          coloricons: kPrimaryColor,
                          fontWeight: FontWeight.w300,
                          iconData: showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                        const Gap(15),
                        TextFieldInput(
                          iconData: Icons.bloodtype,
                          coloricons: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          color: Colors.black26,
                          hint: 'O+',
                          validator: (value) {
                            if (value == "") {
                              return "veuillez remplir ce champ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const Gap(15),
                        TextFieldInput(
                          iconData: Icons.location_on,
                          coloricons: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          color: Colors.black26,
                          hint: 'Chittagong, BD.',
                          validator: (value) {
                            if (value == "") {
                              return "veuillez remplir ce champ";
                            } else {
                              return null;
                            }
                          },
                        ),
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
