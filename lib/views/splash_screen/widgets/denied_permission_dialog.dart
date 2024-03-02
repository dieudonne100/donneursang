import 'dart:io';

import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/splash_screen/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeniedPermissionDialog extends ConsumerWidget {
  final BuildContext mainContext;
  const DeniedPermissionDialog({super.key, required this.mainContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Permission refusée !",
            style: TextStyle(fontFamily: 'poppins-Medium', fontSize: 16),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Vous devez accorder l’autorisation d’accès a votre position à cette application, faute de quoi "
            "elle ne pourra vous être utile.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontFamily: 'poppins-Medium',
                fontSize: 16),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            color: kPrimaryColor,
            onPressed: () async {
              Navigator.pop(context);
              ref
                  .read(splashControllerProvider)
                  .getPositionAfterLoad(mainContext);
            },
            text: "ACCORDER LA PERMISSION",
            isFullWidth: true,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomButton(
            color: kPrimaryColor,
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
            text: "FERMER",
            isFullWidth: true,
          )
        ],
      ),
    );
  }
}
