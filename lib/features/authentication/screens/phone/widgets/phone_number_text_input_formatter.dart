import 'package:flutter/services.dart';
import 'dart:math';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final formattedText = StringBuffer();

    if (digitsOnly.isNotEmpty) {
      formattedText.write(digitsOnly.substring(0, min(digitsOnly.length, 3))); // First 3 digits
    }
    if (digitsOnly.length > 3) {
      formattedText.write(' ');
      formattedText.write(digitsOnly.substring(3, min(digitsOnly.length, 6))); // Next 3 digits
    }
    if (digitsOnly.length > 6) {
      formattedText.write('-');
      formattedText.write(digitsOnly.substring(6, min(digitsOnly.length, 8))); // Next 2 digits
    }
    if (digitsOnly.length > 8) {
      formattedText.write('-');
      formattedText.write(digitsOnly.substring(8, min(digitsOnly.length, 10))); // Last 2 digits
    }

    return newValue.copyWith(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}