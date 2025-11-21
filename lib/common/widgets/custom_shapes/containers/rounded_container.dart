import 'package:flutter/material.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = TColors.white,
    this.borderColor = TColors.darkGrey,
    this.enableTopLeftRadius = true,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool enableTopLeftRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: enableTopLeftRadius ? Radius.circular(radius) : Radius.zero,
          topRight: Radius.circular(radius),
          bottomLeft: Radius.circular(TSizes.bg),
          bottomRight: Radius.circular(radius),
        ),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}