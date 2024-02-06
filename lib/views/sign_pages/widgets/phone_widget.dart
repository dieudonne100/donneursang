import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > 3 && newValue.text.length < 7) {
      final String formattedText =
          '${newValue.text.substring(0, 3)}-${newValue.text.substring(3)}';
      return newValue.copyWith(text: formattedText, selection: TextSelection.collapsed(offset: formattedText.length));
    } else if (newValue.text.length >= 7) {
      final String formattedText =
          '${newValue.text.substring(0, 3)}-${newValue.text.substring(3, 6)}-${newValue.text.substring(6)}';
      return newValue.copyWith(text: formattedText, selection: TextSelection.collapsed(offset: formattedText.length));
    }
    return newValue;
  }
}