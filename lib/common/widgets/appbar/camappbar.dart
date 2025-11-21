import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/custom_constants.dart';

class CamAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CamAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showClose = false,
    this.closeColor,
    this.customHeight = false,
  });

  final Widget? title;
  final bool showClose;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color? closeColor;
  final bool customHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showClose
          ? IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          EvaIcons.close,
          color: closeColor ?? Theme.of(context).iconTheme.color,
        ),
      )
          : leadingIcon != null
          ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
          : null,
      title: title,
      actions: actions,
      toolbarHeight: customHeight ? kCustomToolbarHeight : kToolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(customHeight ? kCustomToolbarHeight : kToolbarHeight);
}
