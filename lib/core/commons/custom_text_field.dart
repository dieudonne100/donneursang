import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String? phone)? validator;
  final TextStyle? style;
  final String? hint;
  final Widget? suffix;
  final Widget? preffix;
  final TextStyle? hintStyle;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool hasDecoration;

  const CustomTextField(
      {super.key,
      this.controller,
      this.suffix,
      this.onChanged,
      this.validator,
      this.style,
      this.enabled,
      this.focusNode,
      this.hint,
      this.hintStyle,
      this.keyboardType,
      this.inputFormatters,
      this.hasDecoration = true,
      this.readOnly = false,
      this.onTap,
      this.preffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // color: kPrimaryColor.withOpacity(0.03),
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        controller: controller,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: enabled,
        validator: validator,
        style: style,
        focusNode: focusNode,
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: preffix,
          hintStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 0,
              color: Color.fromRGBO(221, 218, 218, 1),
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: kPrimaryColor,
              )),
        ),
      ),
    );
  }
}
