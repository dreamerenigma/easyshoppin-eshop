import 'package:easyshoppin_eshop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:easyshoppin_eshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/signup/widgets/terms_conditions_chechbox.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  TSignupFormState createState() => TSignupFormState();
}

class TSignupFormState extends State<TSignupForm> {
  final audioPlayer = AudioPlayer();

  Future<void> playButtonClickSound() async {
    await audioPlayer.play(AssetSource('sounds/click_button.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(labelText: S.of(context).firstName, prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(labelText: S.of(context).lastName, prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(labelText: S.of(context).username, prefixIcon: const Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(labelText: S.of(context).email, prefixIcon: const Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(labelText: S.of(context).phoneNumber, prefixIcon: const Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: S.of(context).password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// TermsConditions Checkbox
          const TTermAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await playButtonClickSound();
                controller.signup();
              },
              child: Text(S.of(context).createAccount)
            ),
          ),
        ],
      ),
    );
  }
}

