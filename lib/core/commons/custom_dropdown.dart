import 'package:donneursang/core/constants/themes.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? title;
  final List<T> options;
  final String hint;
  final void Function(T?)? onChanged;
  final T? value;
  final double borderRadius;
  final String Function(T)? dropDownMenuText;

  const CustomDropdown(
      {super.key,
      required this.options,
      this.title,
      required this.hint,
      this.onChanged,
      this.value,
      this.borderRadius = 8,
      this.dropDownMenuText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SizedBox(
              width: double.infinity,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButtonFormField(
                    items: dropDownMenuText == null
                        ? null
                        : options
                            .map((T e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    dropDownMenuText!(e),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ))
                            .toList(),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: kPrimaryColor.withOpacity(0.05),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        border: InputBorder.none),
                    value: value,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(8),
                    hint: Text(
                      hint,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic),
                    ),
                    onChanged: onChanged,
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
