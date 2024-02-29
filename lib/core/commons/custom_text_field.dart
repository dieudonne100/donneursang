import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String? phone)? validator;
  final TextStyle? style;
  final String? hint;
  final Widget? suffix;
  final TextStyle? hintStyle;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool hasDecoration;

  const CustomTextField(
      {Key? key,
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
      this.hasDecoration = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        suffixIconConstraints: const BoxConstraints(),
        hintText: hint,
        hintStyle: hintStyle,
        border: hasDecoration
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(221, 218, 218, 1),
                ),
              )
            : InputBorder.none,
        focusedBorder: hasDecoration
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                  width: 1.0,
                ),
              )
            : InputBorder.none,
      ),
    );
  }
}
