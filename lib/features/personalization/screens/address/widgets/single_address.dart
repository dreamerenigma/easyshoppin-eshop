import 'package:easyshoppin_eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/address_controller.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../models/address_model.dart';
import 'edit_address_bottom_dialog.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.address,
    required this.onTap
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;

      return InkWell(
        onTap: onTap,
        highlightColor: TColors.buttonDarkGrey,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        child: TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.bg),
          width: double.infinity,
          backgroundColor: selectedAddress ? TColors.primary.withAlpha((0.5 * 255).toInt()) : TColors.transparent,
          borderColor: selectedAddress ? TColors.transparent : dark ? TColors.darkerGrey : TColors.grey,
          child: Stack(
            children: [
              Positioned(
                right: -10,
                top: 2,
                child: InkWell(
                  onTap: () {
                    editAddressBottomDialog(context);
                  },
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: dark ? TColors.darkGrey : TColors.dark,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress ? dark ? TColors.light : TColors.dark : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(address.formattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(address.toString(), softWrap: true),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
