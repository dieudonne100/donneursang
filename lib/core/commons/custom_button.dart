import 'package:donneursang/core/commons/extensions/string_extension.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final bool isFullWidth;
  final Color color;
  final Color colorText;
  final bool isDisabled;
  final bool transparent;
  final bool loading;
  final bool uppercase;
  final double radius;
  const CustomButton(
      {Key? key,
      this.onPressed,
      this.text,
      this.child,
      this.isFullWidth = false,
      this.color =kPrimaryColor,
      this.isDisabled = false,
      this.transparent = false,
      this.loading = false,
      this.colorText = Colors.white,
      this.uppercase = true,
      this.radius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: isFullWidth ? double.infinity : null,
      child: TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
              backgroundColor:
                  transparent ? null : color.withOpacity(isDisabled ? 0.5 : 1),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))),
          child: loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(colorText),
                    strokeWidth: 2,
                  ),
                )
              : (text != null
                  ? Text(
                      uppercase ? text!.toUpperCase() : text!.capitalize(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorText, fontWeight: FontWeight.w500),
                    )
                  : child!)),
    );
  }
}
