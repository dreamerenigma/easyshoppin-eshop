import 'package:audioplayers/audioplayers.dart';
import 'package:easyshoppin_eshop/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/storage_keys.dart';
import '../../../../../utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  TLoginFormState createState() => TLoginFormState();
}

class TLoginFormState extends State<TLoginForm> {
  final audioPlayer = AudioPlayer();
  final localStorage = GetStorage();

  Future<void> playButtonClickSound() async {
    await audioPlayer.play(AssetSource('sounds/click_button.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    // Load stored email and password
    final storedEmail = localStorage.read(StorageKeys.email);
    final storedPassword = localStorage.read(StorageKeys.password);

    // Initialize text controllers with stored values if they exist
    if (storedEmail != null) {
      controller.email.text = storedEmail;
    }
    if (storedPassword != null) {
      controller.password.text = storedPassword;
    }

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(prefixIcon: const Icon(Iconsax.direct_right), labelText: S.of(context).email),
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
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            GestureDetector(
              onTap: () {
                controller.rememberMe.value = !controller.rememberMe.value;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                        ),
                      ),
                      Text(S.of(context).rememberMe),
                    ],
                  ),

                  /// Forget Password
                  TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: Text(S.of(context).forgetPassword),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(context), child: Text(S.of(context).signIn))),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: Text(S.of(context).createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
