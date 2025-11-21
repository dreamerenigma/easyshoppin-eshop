import 'package:flutter/material.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';

class CustomTab extends StatelessWidget {
  final IconData? icon;
  final String text;
  final bool isSelected;

  const CustomTab({
    super.key,
    this.icon,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = isSelected ? TColors.white : TColors.grey;
    Color textColor = isSelected ? TColors.white : TColors.grey;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? TColors.steelGrey : TColors.buttonDarkGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Tab(
        height: 32,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 22, color: iconColor),
              const SizedBox(width: 8.0),
            ],
            Text(text, style: TextStyle(color: textColor, fontSize: TSizes.fontSizeSm)),
          ],
        ),
      ),
    );
  }
}
