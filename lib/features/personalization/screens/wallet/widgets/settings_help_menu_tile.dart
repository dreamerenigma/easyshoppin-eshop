import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';

class SettingsHelpMenuTile extends StatelessWidget {
  const SettingsHelpMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
    this.isSvg = false,
  });

  final dynamic icon;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      child: ListTile(
        leading: isSvg
            ? SvgPicture.asset(
                icon,
                width: 28,
                height: 28,
                colorFilter: const ColorFilter.mode(TColors.primary, BlendMode.srcIn),
              )
            : Icon(icon, size: 28, color: TColors.primary),
        title: subTitle.isEmpty
            ? Align(
                alignment: Alignment.centerLeft,
                child: Text(title, style: TextStyle(fontSize: TSizes.fontSizeSm)),
              )
            : Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: subTitle.isNotEmpty
            ? Text(subTitle, style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey))
            : null,
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: TColors.darkGrey),
      ),
    );
  }
}
