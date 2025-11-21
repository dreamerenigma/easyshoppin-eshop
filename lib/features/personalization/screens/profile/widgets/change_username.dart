import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:easyshoppin_eshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../controllers/update_username_controller.dart';

class ChangeUsername extends StatelessWidget {
  const ChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserNameController());
    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(S.of(context).titleChangeUsername, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(S.of(context).subtitleChangeUsername, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections),
            /// Text field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextSelectionTheme(
                    data: TextSelectionThemeData(
                      cursorColor: TColors.blue,
                      selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                      selectionHandleColor: TColors.blue,
                    ),
                    child: TextFormField(
                      controller: controller.userName,
                      validator: (value) => TValidator.validateEmptyText('Username', value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: S.of(context).username,
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                        hintText:  S.of(context).enterUsername,
                        hintStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeMd),
                        border: const UnderlineInputBorder(borderSide: BorderSide(color: TColors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: TColors.black,
                ),
                child: Text(S.of(context).save, style: TextStyle(color: TColors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
