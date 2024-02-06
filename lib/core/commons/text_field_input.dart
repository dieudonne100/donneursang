import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String value)? onChanged;
  final void Function()? onLongPressUp;
  final void Function()? onTap;
  final void Function(LongPressDownDetails value)? onLongPressDown;
  final String? hint;
  final FocusNode? focusNode;

  final FontWeight? fontWeight;
  final Color? color;
  final Color? coloricons;
  final String? initialText;
  final bool readOnly;
  final IconData? iconData;

  const TextFieldInput({
    Key? key,
    this.controller,
    this.focusNode,
    this.label,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.onLongPressUp,
    this.onTap,
    this.onLongPressDown,
    this.hint,
    this.fontWeight,
    this.color,
    this.coloricons,
    this.initialText,
    this.readOnly = false,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          initialValue: initialText,
          readOnly: readOnly,
          enableInteractiveSelection: false,
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.center,
          obscuringCharacter: "*",
          style: TextStyle(
              fontSize: 14,
              fontWeight: fontWeight,
              fontFamily: "Poppins",
              backgroundColor: Colors.transparent),
          decoration: InputDecoration(
            prefixIcon: Icon(iconData, color: coloricons),
            hintText: hint,

            hintStyle:
                TextStyle(fontSize: 14, fontWeight: fontWeight, color: color),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
