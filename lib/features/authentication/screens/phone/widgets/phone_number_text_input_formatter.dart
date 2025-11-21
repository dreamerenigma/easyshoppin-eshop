import 'package:flutter/services.dart';
import 'dart:math';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all non-digit characters
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Check if the number has a '+7' at the beginning and add it if it's missing
    StringBuffer formattedText = StringBuffer();
    if (digitsOnly.isNotEmpty) {
      formattedText.write('+7 '); // Always start with +7
      // Now add the rest of the digits
      if (digitsOnly.length > 1) {
        formattedText.write(digitsOnly.substring(1, min(digitsOnly.length, 4))); // 3 digits after +7
      }
    }

    if (digitsOnly.length > 3) {
      formattedText.write(' ');
      formattedText.write(digitsOnly.substring(4, min(digitsOnly.length, 7))); // 3 more digits
    }

    if (digitsOnly.length > 6) {
      formattedText.write('-');
      formattedText.write(digitsOnly.substring(7, min(digitsOnly.length, 9))); // Next 2 digits
    }

    if (digitsOnly.length > 8) {
      formattedText.write('-');
      formattedText.write(digitsOnly.substring(9, min(digitsOnly.length, 11))); // Last digit
    }

    return newValue.copyWith(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
