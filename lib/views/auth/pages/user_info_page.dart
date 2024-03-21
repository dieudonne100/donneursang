import 'dart:io';

import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/core/commons/sign_up_form.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({
    super.key,
  });

  @override
  ConsumerState<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  saveUserDataToFirebase() async {
    ref.read(loginControllerProvider).createUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var loginController = ref.watch(loginControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text(
          'Profile info',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Text(
              'Please provide your name and an optional profile photo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: loginController.avatarPath == null
                              ? const AssetImage(
                                      "assets/images/emptyprofil.png")
                                  as ImageProvider
                              : FileImage(File(loginController.avatarPath!)),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        loginController.pickAvatar();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: kPrimaryColor),
                          color: kPrimaryColor,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SignUpForm(
              onEdit: () {
                setState(() {});
              },
            ),
            const SizedBox(height: 40),
            CustomButton(
              isFullWidth: true,
              onPressed: saveUserDataToFirebase,
              text: 'ENREGISTER',
            )
          ],
        ),
      ),
    );
  }
}
