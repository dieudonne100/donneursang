import 'package:donneursang/views/otpView/widgets/otp_widget.dart';
import 'package:flutter/material.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  OtpWidget(),
        
      
    );
  }
}
