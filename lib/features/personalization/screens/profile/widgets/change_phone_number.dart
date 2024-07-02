import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/sizes.dart';
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
                  TextFormField(
                    controller: controller.phoneNumber,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: S.of(context).phoneNumber,
                      hintText: S.of(context).enterPhoneNumber,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).pleaseEnterPhoneNumber;
                      }
                      // You can add more validation if needed
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updatePhoneNumber(),
                child: Text(S.of(context).save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
