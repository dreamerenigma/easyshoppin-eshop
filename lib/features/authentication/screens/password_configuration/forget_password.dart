import 'package:audioplayers/audioplayers.dart';
import 'package:easyshoppin_eshop/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:easyshoppin_eshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();
    final controller = Get.put(ForgetPasswordController());

    Future<void> playButtonClickSound() async {
      await audioPlayer.play(AssetSource('sounds/click_button.mp3'));
    }

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).forgetPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings

            const SizedBox(height: TSizes.spaceBtwItems),
            Text(S.of(context).forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await playButtonClickSound();
                  controller.sendPasswordResetEmail();
                },
                child: Text(S.of(context).submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
