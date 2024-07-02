import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easyshoppin_eshop/features/authentication/controllers/login/login_controller.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/phone/widgets/phone_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(context),
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.google),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebook),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          S.of(context).orSignInPhone,
          style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => Get.to(() => const TPhoneForm()),
            icon: const Icon(
              BootstrapIcons.phone,
              size: TSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
