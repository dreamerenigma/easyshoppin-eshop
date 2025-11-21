import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../controllers/update_gender_controller.dart';

class ChangeGender extends StatelessWidget {
  const ChangeGender({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateGenderController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(S.of(context).titleChangeGender, style: TextStyle(fontSize: TSizes.fontSizeMg)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.spaceBtwItemsSmall),
            child: Text(S.of(context).subTitleChangeGender, style: Theme.of(context).textTheme.labelMedium),
          ),
          Form(
            key: controller.updateGenderFormKey,
            child: Column(
              children: [
                Obx(() => Material(
                  color: controller.selectedGender.value == S.of(context).maleGender ? TColors.blue.withAlpha((0.1 * 255).toInt()) : TColors.transparent,
                  child: InkWell(
                    onTap: () {
                      controller.selectedGender.value = S.of(context).maleGender;
                    },
                    splashColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                    highlightColor: Colors.transparent,
                    child: RadioListTile<String>(
                      title: Text(S.of(context).maleGender),
                      value: S.of(context).maleGender,
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.selectedGender.value = value!;
                      },
                      activeColor: TColors.blue,
                    ),
                  ),
                )),
                Obx(() => Material(
                  color: controller.selectedGender.value == S.of(context).femaleGender ? TColors.blue.withAlpha((0.1 * 255).toInt()) : TColors.transparent,
                  child: InkWell(
                    onTap: () {
                      controller.selectedGender.value = S.of(context).femaleGender;
                    },
                    splashColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                    highlightColor: Colors.transparent,
                    child: RadioListTile<String>(
                      title: Text(S.of(context).femaleGender),
                      value: S.of(context).femaleGender,
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        controller.selectedGender.value = value!;
                      },
                      activeColor: TColors.blue,
                    ),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: TSizes.defaultSpace),
          /// Save Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateGender(context),
                child: Text(S.of(context).save),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
