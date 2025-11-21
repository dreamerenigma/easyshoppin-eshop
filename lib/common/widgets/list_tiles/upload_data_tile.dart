import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';

class TUploadDataTile extends StatelessWidget {
  const TUploadDataTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon, size: 28, color: TColors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
