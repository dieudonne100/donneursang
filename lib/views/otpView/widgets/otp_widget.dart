import 'dart:async';

import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/success/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatefulWidget {
  final void Function(String)? onChanged;

  const OtpWidget({super.key, this.onChanged});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final TextEditingController pinkCodeController = TextEditingController();
  bool showLoader = false;
  bool showSuccess = false;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 500,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Gap(100),
                          Image.asset(
                            'assets/images/logoRouge.png',
                            height: 180,
                          ),
                          const Gap(40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Pinput(
                                controller: pinkCodeController,
                                onChanged: widget.onChanged,
                                autofocus: true,
                                length: 4,
                                showCursor: true,
                                preFilledWidget: const CircleAvatar(
                                  radius: 4,
                                  backgroundColor:
                                      Color.fromRGBO(0, 0, 0, 0.12),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                defaultPinTheme: PinTheme(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900),
                                  width: 59,
                                  height: 59,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            0, 0, 0, 0.12)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  width: 59,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            0, 0, 0, 0.12)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                submittedPinTheme: PinTheme(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  width: 59,
                                  height: 59,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color:
                                            pinkCodeController.text.length != 4
                                                ? Colors.red
                                                : kBlackColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                errorPinTheme: PinTheme(
                                  height: 59,
                                  width: 59,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 2, color: Colors.red),
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
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Le code OTP que vous avez utilisé est incorrect ! Veuiller entrer le code corecte',
                                                style: GoogleFonts.dosis(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "Poppins",
                                                      color: kWhiteColor),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kWhiteColor),
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
                                        behavior: SnackBarBehavior.fixed,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15))),
                                      ),
                                    );
                                  }
                                  return null;
                                },
                                pinputAutovalidateMode:
                                    PinputAutovalidateMode.onSubmit,
                                onCompleted: (_) {
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      showLoader = false;
                                      showSuccess = true;
                                    });
                                  });
                                  Future.delayed(const Duration(seconds: 3),
                                      () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SuccessPage(),
                                      ),
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                          const Gap(50),
                          Text(
                            'Renvoyer le code \n(Dans 30s)',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jetBrainsMono(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 50),
                          if (showLoader && !showSuccess)
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.green,
                                strokeWidth: 3,
                              )),
                            ),
                          if (showSuccess)
                            Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 3, color: Colors.green),
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  weight: 50,
                                  size: 26,
                                )),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showCustomToast() {
    Fluttertoast.showToast(
      msg: '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.transparent,
      textColor: Colors.transparent,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  Widget buildCustomToast() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Le code OTP que vous avez utilisé est incorrect ! Veuiller entrer le code correct. ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Fluttertoast.cancel(); // Fermer le toast
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
