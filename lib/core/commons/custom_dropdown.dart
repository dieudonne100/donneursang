import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? hint;
  final String? value;
  final void Function(String?)? onChanged;
  final List<String> items;

  const CustomDropdown(
      {Key? key, this.hint, this.value, this.onChanged, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<String>(
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            );
          }).toList(),
          value: value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(vertical: 17),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8))),
          hint: hint == null ? null : Text(hint!),
          validator: (value) {
            if (value == null) {
              return "Required";
            } else {
              return null;
            }
          },
          onChanged: onChanged,
        ),
      ),
    );
  }
}
