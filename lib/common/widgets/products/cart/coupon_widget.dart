import 'package:easyshoppin_eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.bg),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? TColors.white.withAlpha((0.5 * 255).toInt()) : TColors.dark.withAlpha((0.5 * 255).toInt()),
                backgroundColor: Colors.grey.withAlpha((0.2 * 255).toInt()),
                side: BorderSide(color: Colors.grey.withAlpha((0.1 * 255).toInt())),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
