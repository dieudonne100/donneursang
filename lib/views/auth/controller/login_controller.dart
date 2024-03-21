import 'dart:io';

import 'package:donneursang/core/common/helper/show_loading_dialog.dart';
import 'package:donneursang/core/commons/footer.dart';
import 'package:donneursang/core/providers/providers.dart';
import 'package:donneursang/core/utils/utils.dart';
import 'package:donneursang/main.dart';
import 'package:donneursang/views/auth/pages/user_info_page.dart';
import 'package:donneursang/views/auth/pages/verification_page.dart';
import 'package:donneursang/views/sign_pages/sign_inpage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final loginControllerProvider =
    ChangeNotifierProvider((ref) => LoginController(ref));

class LoginController extends ChangeNotifier {
  final Ref ref;
  LoginController(this.ref);

  final TextEditingController otpController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  TextEditingController lastNnameController = TextEditingController();
  TextEditingController firstNnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String bloodGroup = 'A+';
  DateTime? birthDate;
  String gender = 'M.';
  bool? isDonor;
  String? avatarPath;

  final supabase = Supabase.instance.client;

  void setBirthDate(DateTime value) {
    birthDate = value;
    notifyListeners();
  }

  void setGender(String value) {
    gender = value;
    notifyListeners();
  }

  void setBloodGroup(String value) {
    bloodGroup = value;
    notifyListeners();
  }

  void setIsdonor(bool value) {
    isDonor = value;
    notifyListeners();
  }

  Future<void> pickAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      avatarPath = result.files.single.path!;
      notifyListeners();
    }
  }

  Future<void> signInWithPhone(BuildContext context) async {
    try {
      if (!context.mounted) return;
      showLoadingDialog(
        context: context,
        message: "Sending a verification code to +237${phoneController.text}",
      );
      final userCheckResponse = await supabase
          .from('users')
          .select()
          .eq('phone', phoneController.text);

      if (userCheckResponse.isNotEmpty) {
        if (!context.mounted) return;
        Navigator.pop(context);
        Utils.showSnackBar(
          content: "User with this email already exists",
          context: context,
        );
      } else {
        await supabase.auth.signInWithOtp(phone: "237${phoneController.text}");
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => VerificationPage(
                        phoneNumber: phoneController.text,
                      )),
              (route) => false);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Utils.showToast(context);
      }
    }
  }

  Future<void> verifyOTP(BuildContext context) async {
    if (!context.mounted) return;
    showLoadingDialog(
      context: context,
      message: 'Verifiying code ... ',
    );
    try {
      await supabase.auth.verifyOTP(
          phone: "237${phoneController.text}",
          token: otpController.text,
          type: OtpType.sms);

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const UserInfoPage()),
            (route) => false);
      }
    } catch (e, _) {
      if (!context.mounted) return;
      Navigator.pop(context);
      if (context.mounted) {
        Utils.showToast(context);
      }
    }
  }

  Future<void> createUser({
    required BuildContext context,
  }) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      if (!context.mounted) return;
      showLoadingDialog(
        context: context,
        message: "Saving user info ... ",
      );
      // Vérifier si l'utilisateur existe déjà
      final userCheckResponse = await supabase
          .from('users')
          .select()
          .eq('email', emailController.text);

      if (userCheckResponse.isNotEmpty) {
        if (!context.mounted) return;
        Navigator.pop(context);
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User with this email already exists')),
        );
        return;
      }

      await supabase.storage
          .from('usersImages')
          .upload(avatarPath?.split("/").last ?? '', File(avatarPath ?? ""));
      await supabase.from('users').insert([
        {
          'firstName': firstNnameController.text,
          'lastName': lastNnameController.text,
          "birthdate": DateFormat('yyyy-MM-dd').format(birthDate!),
          'avatar': avatarPath?.split("/").last ?? '',
          'email': emailController.text,
          'city': preferences.getString("country"),
          'pass': passController.text,
          'bloodGroup': bloodGroup,
          'gender': gender,
          'phone': phoneController.text,
          'isdonor': isDonor,
          "cordonate": {
            "lat": preferences.getDouble("latitude"),
            "lng": preferences.getDouble("longitude"),
            "country": preferences.getString("country"),
            "countryCode": preferences.getString("countryCode"),
            "locality": preferences.getString("locality")
          }
        }
      ]);
      if (!context.mounted) return;
      Navigator.pop(context);
      if (!context.mounted) return;
      Utils.showSnackBar(
          context: context,
          content: "User registered successfully",
          isError: false);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInPage()),
            (route) => false);
      }
      // }
    } catch (e, _) {
      print(e);
      print(_);
      if (!context.mounted) return;
      Navigator.pop(context);
      if (!context.mounted) return;
      Utils.showSnackBar(
        context: context,
        content: "Error: ${e.toString()}",
      );
    }
  }

  Future<void> signInUser({
    required BuildContext context,
  }) async {
    debugPrint("email:${emailController.text} password:${passController.text}");
    final pref = container.read(sharedPreferencesProvider);

    try {
      final userCheckResponse = await supabase.from('users').select().eq(
            'email',
            emailController.text,
          );
      if (userCheckResponse.isEmpty) {
        if (!context.mounted) return;
        Navigator.pop(context);
        Utils.showSnackBar(
          content: "User with this email already not exists",
          context: context,
        );
      } else {
        await pref.setString("user", userCheckResponse.first.toString());
        if (!context.mounted) return;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BottomBar()));
      }
    } catch (e) {
      Navigator.pop(context);
      Utils.showSnackBar(
        context: context,
        content: "Error: ${e.toString()}",
      );
    }
  }
}
