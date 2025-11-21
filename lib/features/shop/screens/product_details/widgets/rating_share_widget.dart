import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';

class TRatingAndShare extends StatelessWidget {
  final bool showShareIcon;

  const TRatingAndShare({
    super.key,
    this.showShareIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '5,0', style: TextStyle(fontSize: TSizes.fontSizeSm)),
                  const TextSpan(text: ' · 199 оценок'),
                ],
              ),
            ),
          ],
        ),
        if (showShareIcon)
        InkWell(
          onTap: () {},
          splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
          highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
          borderRadius: BorderRadius.circular(TSizes.cardRadiusXl),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.share, size: TSizes.iconLg),
          ),
        ),
      ],
    );
  }
}
