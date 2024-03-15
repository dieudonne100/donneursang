import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:donneursang/core/common/helper/show_alert_dialog.dart';
import 'package:donneursang/core/common/widgets/custom_icon_button.dart';
import 'package:donneursang/core/common/widgets/short_h_bar.dart';
import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/core/commons/sign_up_form.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/auth/controller/auth_controller.dart';
import 'package:donneursang/views/auth/pages/image_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key, this.profileImageUrl});

  final String? profileImageUrl;

  @override
  ConsumerState<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  File? imageCamera;
  Uint8List? imageGallery;

  late TextEditingController usernameController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  saveUserDataToFirebase() async {
    // final preferences = await SharedPreferences.getInstance();

    if (usernameController.text.isEmpty) {
      return showAlertDialog(
        context: context,
        message: 'Please provide a username',
      );
    } else if (usernameController.text.length < 3 ||
        usernameController.text.length > 20) {
      return showAlertDialog(
        context: context,
        message: 'A username length should be between 3-20',
      );
    }

    ref.read(authControllerProvider).saveUserInfoToFirestore(
          username: usernameController.text,
          email: emailController.text,
          pass: passController.text,
          gender: genderController.text,
          bloodGroup: bloodGroupController.text,
          city: "",
          fname: usernameController.text,
          state: false,
          profileImage:
              imageCamera ?? imageGallery ?? widget.profileImageUrl ?? '',
          context: context,
          mounted: mounted,
        );
  }

  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            Row(
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Profile photo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                ),
                const SizedBox(width: 15),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(.3),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 20),
                imagePickerIcon(
                  onTap: pickmageFromCamera,
                  icon: Icons.camera_alt_rounded,
                  text: 'Camera',
                ),
                const SizedBox(width: 15),
                imagePickerIcon(
                  onTap: () async {
                    log('hello');
                    Navigator.pop(context);
                    final image = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImagePickerPage(),
                      ),
                    );
                    if (image == null) return;
                    setState(() {
                      imageGallery = image;
                      imageCamera = null;
                    });
                  },
                  icon: Icons.photo_camera_back_rounded,
                  text: 'Gallery',
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }

  pickmageFromCamera() async {
    try {
      Navigator.pop(context);
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera = File(image!.path);
        imageGallery = null;
      });
    } catch (e) {
      if (!context.mounted) return;
      showAlertDialog(context: context, message: e.toString());
    }
  }

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onTap,
          icon: icon,
          iconColor: Colors.green,
          minWidth: 50,
          border: Border.all(
            color: Colors.grey.withOpacity(.2),
            width: 1,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            GestureDetector(
              onTap: imagePickerTypeBottomSheet,
              child: Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                  border: Border.all(
                    color: imageCamera == null && imageGallery == null
                        ? Colors.transparent
                        : Colors.grey.withOpacity(.4),
                  ),
                  image: imageCamera != null ||
                          imageGallery != null ||
                          widget.profileImageUrl != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: imageGallery != null
                              ? MemoryImage(imageGallery!)
                              : widget.profileImageUrl != null
                                  ? NetworkImage(widget.profileImageUrl!)
                                  : FileImage(imageCamera!) as ImageProvider,
                        )
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 3),
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    size: 48,
                    color: imageCamera == null &&
                            imageGallery == null &&
                            widget.profileImageUrl == null
                        ? kPrimaryColor
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SignUpForm(
              onEdit: () {
                setState(() {});
              },
              emailController: emailController,
              passController: passController,
              fnameController: usernameController,
              phoneController: phoneController,
              cityController: cityController,
              stateController: stateController,
              bloodGroupController: bloodGroupController,
              genderController: genderController,
              date: DateTime.now(),
            ),
            const SizedBox(height: 40),
            CustomButton(
              isFullWidth: true,
              onPressed: saveUserDataToFirebase,
              text: 'NEXT',
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomElevatedButton(
      //   onPressed: saveUserDataToFirebase,
      //   text: 'NEXT',
      //   buttonWidth: 90,
      // ),
    );
  }
}
