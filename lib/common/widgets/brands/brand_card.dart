import 'package:flutter/material.dart';
import '../../../features/shop/models/brand_model.dart';
import '../images/t_circular_image.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final isNetworkImage = brand.image.startsWith('http') || brand.image.startsWith('https');

    return InkWell(
      onTap: onTap,
      splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
      /// Container Design
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: TColors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: isNetworkImage,
                image: brand.image,
                backgroundColor: TColors.transparent,
                overlayColor: dark ? TColors.white : TColors.youngNight,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
