import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/update_change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateChangePasswordController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(S.of(context).titleChangePassword, style: TextStyle(fontSize: TSizes.fontSizeXl)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).subTitleChangePassword,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Form(
              key: controller.updatePasswordFormKey,
              child: Column(
                children: [
                  /// Password
                  Obx(
                    () => TextSelectionTheme(
                      data: TextSelectionThemeData(
                        cursorColor: TColors.blue,
                        selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                        selectionHandleColor: TColors.blue,
                      ),
                      child: TextFormField(
                        validator: (value) => TValidator.validatePassword(context, value),
                        controller: controller.password,
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: S.of(context).password,
                          labelStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeMd),
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  /// Password Confirmation
                  Obx(
                    () => TextSelectionTheme(
                      data: TextSelectionThemeData(
                        cursorColor: TColors.blue,
                        selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                        selectionHandleColor: TColors.blue,
                      ),
                      child: TextFormField(
                        validator: (value) => TValidator.combinedPasswordConfirmValidator(context, value, controller.password.text),
                        controller: controller.passwordConfirm,
                        obscureText: controller.hidePasswordConfirm.value,
                        decoration: InputDecoration(
                          labelText: S.of(context).passwordConfirm,
                          labelStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeMd),
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePasswordConfirm.value = !controller.hidePasswordConfirm.value,
                            icon: Icon(controller.hidePasswordConfirm.value ? Iconsax.eye_slash : Iconsax.eye),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updatePassword(context),
                child: Text(S.of(context).save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
