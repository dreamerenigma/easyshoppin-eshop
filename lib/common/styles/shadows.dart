import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withAlpha((0.1 * 255).toInt()),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
      color: TColors.darkGrey.withAlpha((0.1 * 255).toInt()),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}
