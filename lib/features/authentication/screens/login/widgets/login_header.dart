import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_sizes.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.appLogoLight : TImages.appLogoDark),
        ),
        const SizedBox(height: TSizes.mg),
        Text(S.of(context).loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.sm),
        Text(S.of(context).loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
