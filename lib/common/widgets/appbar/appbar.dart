import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.backArrowColor,
    this.customHeight = false,
    this.titleSpacing = 16,
    this.showShadow = false,
    this.appBarHeight = kToolbarHeight,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? backArrowColor;
  final bool customHeight;
  final double titleSpacing;
  final bool showShadow;
  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: showShadow ? 4.0 : 0.0,
      shadowColor: showShadow ? TColors.black.withAlpha((0.3 * 255).toInt()) : TColors.transparent,
      leading: showBackArrow
        ? MouseRegion(
          cursor: SystemMouseCursors.basic,
            child: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Get.back();
              }
            },
            padding: EdgeInsets.zero,
            highlightColor: THelperFunctions.isDarkMode(context) ? TColors.buttonDarkGrey : TColors.buttonGrey,
            icon: Icon(
              EvaIcons.arrowIosBackOutline,
              color: backArrowColor ?? Theme.of(context).iconTheme.color,
              size: 30,
            ),
                  ),
          )
        : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      actions: actions,
      toolbarHeight: appBarHeight,
      titleSpacing: titleSpacing,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
