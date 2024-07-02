import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary),
      title: subTitle.isEmpty
        ? Center(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
        )
        : Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: subTitle.isNotEmpty
          ? Text(subTitle, style: Theme.of(context).textTheme.labelMedium)
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
