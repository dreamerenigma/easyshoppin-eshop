import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class TUploadDataTile extends StatelessWidget {
  const TUploadDataTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon; // Icon data type to hold HeroIcon
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary), // Use Icon widget to display the icon
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
