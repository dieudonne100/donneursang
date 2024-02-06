import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class PinField extends StatefulWidget {
  final void Function(String)? onChanged;

  const PinField({Key? key, this.onChanged}) : super(key: key);

  @override
  State<PinField> createState() => _PinFieldState();
}

class _PinFieldState extends State<PinField> {
  final TextEditingController pinkCodeController = TextEditingController();
  bool showLoader = false;
  bool showSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pinput(
          controller: pinkCodeController,
          onChanged: widget.onChanged,
          autofocus: false,
          length: 4,
          showCursor: false,
          preFilledWidget: const CircleAvatar(
            radius: 4,
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.12),
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          defaultPinTheme: PinTheme(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
            width: 59,
            height: 59,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.12)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          focusedPinTheme: PinTheme(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            width: 59,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.12)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          submittedPinTheme: PinTheme(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            width: 59,
            height: 59,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          errorPinTheme: PinTheme(
            height: 59,
            width: 59,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (_) {
            if (pinkCodeController.text.length == 4) {
              setState(() {
                showLoader = true;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Le code OTP que vous avez utilisé est incorrect !',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: 16, color: kWhiteColor),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: kWhiteColor),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.close,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  margin: const EdgeInsets.only(
                      bottom: 16.0, left: 16.0, right: 16.0),
                ),
              );
            }
            return null;
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          onCompleted: (showValueIndicatorsOnComplete) {
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                showLoader = false;
                showSuccess = true;
              });
            });
          },
        ),
      ],
    );
  }
}
