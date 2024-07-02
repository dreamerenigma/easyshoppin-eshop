import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SecondTabContent extends StatelessWidget {
  const SecondTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isDarkTheme ? TColors.darkerGrey : TColors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '-96 ₽',
                      style: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(Icons.access_time, size: 20.0),
                  SizedBox(width: 8),
                  Text(
                    'До 27 июня',
                    style: TextStyle(fontSize: TSizes.fontSizeSm),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'купон на заказ от 291 ₽',
                style: TextStyle(fontSize: TSizes.fontSizeMd),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const TCircularIcon(
                    icon: Iconsax.minus,
                    width: 32,
                    height: 32,
                    size: TSizes.md,
                  ),
                  const SizedBox(width: 8),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isDarkTheme ? TColors.darkGrey : TColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      S.of(context).toProducts,
                      style: const TextStyle(fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
