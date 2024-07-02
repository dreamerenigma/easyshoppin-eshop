import 'package:easyshoppin_eshop/common/widgets/texts/section_heading.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () => addressController.selectedAddressPopup(context)),
        addressController.selectedAddress.value.id.isNotEmpty
          ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Codding with Input Studios', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text('+7-937-030-98-61', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.location_history, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(child: Text('South Liana, Maine 87695, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
                ],
              ),
            ],
          ) : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
