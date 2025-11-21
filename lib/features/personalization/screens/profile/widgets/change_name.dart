import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(S.of(context).titleChangeName, style: TextStyle(fontSize: TSizes.fontSizeBg)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(S.of(context).subtitleChangeName, style: Theme.of(context).textTheme.labelMedium),
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
                      controller: controller.firstName,
                      validator: (value) => TValidator.validateEmptyText(S.of(context).firstName, value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: S.of(context).firstName,
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                        hintText: S.of(context).enterFirstName,
                        hintStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeMd),
                        border: const UnderlineInputBorder(borderSide: BorderSide(color: TColors.white)),
                      ),
                      style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextSelectionTheme(
                    data: TextSelectionThemeData(
                      cursorColor: TColors.blue,
                      selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                      selectionHandleColor: TColors.blue,
                    ),
                    child: TextFormField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText(S.of(context).lastName, value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: S.of(context).lastName,
                        prefixIcon: const Icon(Icons.group),
                        hintText: S.of(context).enterLastName,
                        hintStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeMd),
                        border: const UnderlineInputBorder(borderSide: BorderSide(color: TColors.white)),
                      ),
                      style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400),
                      textCapitalization: TextCapitalization.sentences,
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
                onPressed: () => controller.updateFirstLastName(context),
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
