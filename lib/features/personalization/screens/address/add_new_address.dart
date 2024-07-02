import 'package:easyshoppin_eshop/features/personalization/controllers/address_controller.dart';
import 'package:easyshoppin_eshop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text(S.of(context).addNewAddress, style: const TextStyle(fontSize: TSizes.fontSizeBg))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => TValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(prefixIcon: const Icon(Iconsax.user), labelText: S.of(context).name),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: TValidator.validatePhoneNumber,
                  decoration: InputDecoration(prefixIcon: const Icon(Iconsax.mobile), labelText: S.of(context).phoneNumber),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => TValidator.validateEmptyText('Street', value),
                        decoration: InputDecoration(labelText: S.of(context).street, prefixIcon: const Icon(Iconsax.building_31)),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => TValidator.validateEmptyText('Postal Code', value),
                        decoration: InputDecoration(prefixIcon: const Icon(Iconsax.code), labelText: S.of(context).postalCode)),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => TValidator.validateEmptyText('City', value),
                        expands: false,
                        decoration: InputDecoration(labelText: S.of(context).city, prefixIcon: const Icon(Iconsax.building)),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => TValidator.validateEmptyText('State', value),
                        expands: false,
                        decoration: InputDecoration(labelText: S.of(context).state, prefixIcon: const Icon(Iconsax.activity)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => TValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(prefixIcon: const Icon(Iconsax.global), labelText: S.of(context).country)),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.addNewAddresses();
                    },
                  child: Text(S.of(context).save)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
