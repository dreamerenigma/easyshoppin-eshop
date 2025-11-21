import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:easyshoppin_eshop/utils/constants/app_sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n/l10n.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              flex: 5,
              child: Text(
                _obfuscatePassword(context, title, value),
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwDefault),
            Icon(icon, size: 18, color: TColors.darkGrey),
          ],
        ),
      ),
    );
  }

  String _obfuscatePassword(BuildContext context, String title, String value) {
    if (title.trim().toLowerCase() == S.of(context).password.toLowerCase()) {
      return '**********';
    }
    return value;
  }
}
