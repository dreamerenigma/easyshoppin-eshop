import 'package:flutter/cupertino.dart';

import '../../generated/l10n/l10n.dart';

class TValidator {
  /// Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  /// Email Validation
  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return S.of(context).invalidEmailAddress;
    }

    return null;
  }

  /// Password Validation
  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordIsRequired;
    }

    // Check for minimum password length
    if (value.length < 6) {
      return S.of(context).passwordLeastSixCharactersLong;
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return S.of(context).passwordLeastOneUppercaseLetter;
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return S.of(context).passwordLeastOneNumber;
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return S.of(context).passwordLeastOneSpecialCharacter;
    }

    return null;
  }

  /// Password Confirm Validation
  static String? validatePasswordConfirm(BuildContext context, String? value, String? password) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordConfirmationRequired;
    }

    if (value != password) {
      return S.of(context).passwordsDoNotMatch;
    }

    return null;
  }

  /// Combined Password Validation for Confirm Field
  static String? combinedPasswordConfirmValidator(BuildContext context, String? value, String? password) {
    String? validationResult = validatePassword(context, value);
    if (validationResult != null) return validationResult;
    return validatePasswordConfirm(context, value, password);
  }

  /// Phone Number Confirm Validation
  static String? validatePhoneNumber(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).phoneNumberIsRequired;
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return S.of(context).invalidPhoneNumberFormat;
    }

    return null;
  }
}
