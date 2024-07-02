import 'package:easyshoppin_eshop/features/personalization/screens/terms/terms.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../personalization/screens/privacy_policy/privacy_policy.dart';
import '../../../controllers/signup/signup_controller.dart';

class TTermAndConditionCheckbox extends StatelessWidget {
  const TTermAndConditionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        controller.privacyPolicy.value = !controller.privacyPolicy.value;
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Obx(
              () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
              ),
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwDefault),
          Expanded( // Use Expanded to allow the text to wrap
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${S.of(context).iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12.0),
                  ),
                  TextSpan(
                    text: '${S.of(context).privacyPolicyRegister} ',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                      fontSizeDelta: -2.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const PrivacyPolicyScreen());
                      },
                  ),
                  TextSpan(
                    text: '${S.of(context).and} ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12.0),
                  ),
                  TextSpan(
                    text: S.of(context).termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                      fontSizeDelta: -2.0,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const TermsOfUseScreen());
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
