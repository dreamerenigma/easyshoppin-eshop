import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/utils/constants/app_sizes.dart';
import '../../constants/app_colors.dart';

class TAppBarTheme{
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.transparent,
    surfaceTintColor: TColors.transparent,
    iconTheme: IconThemeData(color: TColors.youngNight, size: TSizes.iconLg),
    actionsIconTheme: IconThemeData(color: TColors.youngNight, size: TSizes.iconLg),
    titleTextStyle: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.w600, color: TColors.youngNight),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.transparent,
    surfaceTintColor: TColors.transparent,
    iconTheme: IconThemeData(color: TColors.youngNight, size: TSizes.iconLg),
    actionsIconTheme: IconThemeData(color: TColors.white, size: TSizes.iconLg),
    titleTextStyle: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.w600, color: TColors.white),
  );
}