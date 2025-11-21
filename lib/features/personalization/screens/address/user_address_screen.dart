import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/address_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/add_new_address.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:easyshoppin_eshop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../utils/widgets/no_glow_scroll_behavior.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(S.of(context).addresses, style: const TextStyle(fontSize: TSizes.fontSizeXl)),
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.spaceBtwItemsSmall),
            child: Obx(
              () => FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  /// Helper Function: Handle Loader, No Record, OR Error Message
                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, context: context);
                  if (response != null) return response;

                  final addresses = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => Column(
                      children: [
                        TSingleAddress(
                          address: addresses[index],
                          onTap: () => controller.selectAddress(addresses[index]),
                        ),
                        if (index < addresses.length - 1) const SizedBox(height: TSizes.spaceBtwItems),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white, size: 32),
      ),
    );
  }
}
