import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../authentication/screens/phone/widgets/phone_number_text_input_formatter.dart';
import '../../../controllers/update_phone_number_controller.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          S.of(context).titleChangePhoneNumber,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).subTitleChangePhoneNumber,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            Form(
              key: controller.updatePhoneNumberFormKey,
              child: Column(
                children: [
                  TextSelectionTheme(
                    data: TextSelectionThemeData(
                      cursorColor: TColors.blue,
                      selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                      selectionHandleColor: TColors.blue,
                    ),
                    child: TextFormField(
                      controller: controller.phoneNumber,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [PhoneNumberTextInputFormatter()],
                      decoration: InputDecoration(
                        labelText: S.of(context).phoneNumber,
                        hintText: S.of(context).enterPhoneNumber,
                        hintStyle: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).pleaseEnterPhoneNumber;
                        }
                        return null;
                      },
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
                onPressed: () => controller.updatePhoneNumber(context),
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
