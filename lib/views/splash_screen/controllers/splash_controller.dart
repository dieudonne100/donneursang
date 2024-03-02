import 'package:donneursang/core/utils/utils.dart';
import 'package:donneursang/views/onboarding/onboardings_page.dart';
import 'package:donneursang/views/splash_screen/widgets/denied_permission_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var splashControllerProvider =
    ChangeNotifierProvider((ref) => SplashController());

class SplashController extends ChangeNotifier {
  SplashController();

  Future<void> getPositionAfterLoad(BuildContext context) async {
    try {
      await Utils.determinePosition();

      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingPage()),
          (route) => false);
    } catch (e) {
      if (!context.mounted) return;
      Utils.showCustomDialog(
          context: context,
          canPop: false,
          borderRadius: 16,
          child: (ctx) => DeniedPermissionDialog(
                mainContext: context,
              ));
    }
  }
}
