import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TColors.grey.withAlpha((0.4 * 255).toInt()),
    labelStyle: const TextStyle(color: TColors.youngNight),
    selectedColor: TColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: TColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: TColors.darkerGrey,
    labelStyle: TextStyle(color: TColors.white),
    selectedColor: TColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: TColors.white,
  );
}
