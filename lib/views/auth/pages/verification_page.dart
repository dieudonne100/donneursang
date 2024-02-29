import 'package:donneursang/core/common/widgets/custom_icon_button.dart';
import 'package:donneursang/views/auth/controller/auth_controller.dart';
import 'package:donneursang/views/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  final String smsCodeId;
  final String phoneNumber;

  void verifySmsCode(
    BuildContext context,
    WidgetRef ref,
    String smsCode,
  ) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Verify your number',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text:
                          "You've tried to register +251935838471. before requesting an SMS or Call with your code.",
                    ),
                    TextSpan(
                      text: "Wrong number?",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                hintText: "- - -  - - -",
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    return verifySmsCode(context, ref, value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter 6-digit code',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                Icon(Icons.message, color: Colors.grey),
                SizedBox(width: 20),
                Text(
                  'Resend SMS',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey.withOpacity(.2),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.phone, color: Colors.grey),
                SizedBox(width: 20),
                Text(
                  'Call Me',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
