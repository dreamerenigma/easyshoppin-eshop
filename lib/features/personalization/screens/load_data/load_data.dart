import 'package:carbon_icons/carbon_icons.dart';
import 'package:easyshoppin_eshop/common/widgets/list_tiles/upload_data_tile.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/load_data/widgets/upload_relationships_brands.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/load_data/widgets/upload_relationships_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:remixicon/remixicon.dart';
import 'package:unicons/unicons.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/load_data_controller.dart';

class LoadData extends StatelessWidget {
  const LoadData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// AppBar
            TAppBar(
              title: Text(S.of(context).uploadData, style: const TextStyle(fontSize: TSizes.fontSizeBg)),
              showBackArrow: true,
            ),

            /// -- Body
            const SizedBox(height: TSizes.spaceBtwSections),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// -- Main Record
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(title: S.of(context).mainRecord, showActionButton: false),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TUploadDataTile(
                  icon: Iconsax.category,
                  title: S.of(context).uploadCategories,
                  trailing: const Icon(Remix.upload_cloud_line,
                      size: 28, color: TColors.primary),
                  onTap: () => LoadDataController.instance.loadDataCategoriesPopup(context),
                ),
                TUploadDataTile(
                  icon: Iconsax.heart_tick4,
                  title: S.of(context).uploadBrands,
                  trailing: const Icon(Remix.upload_cloud_line,
                    size: 28, color: TColors.primary),
                  onTap: () => LoadDataController.instance.loadDataBrandsPopup(context),
                ),
                TUploadDataTile(
                  icon: CarbonIcons.product,
                  title: S.of(context).uploadProducts,
                  trailing: const Icon(Remix.upload_cloud_line,
                    size: 28, color: TColors.primary), // Add Remix icon here
                  onTap: () => LoadDataController.instance.loadDataProductsPopup(context),
                ),
                TUploadDataTile(
                  icon: UniconsLine.image_upload,
                  title: S.of(context).uploadBanners,
                  trailing: const Icon(Remix.upload_cloud_line,
                    size: 28, color: TColors.primary),
                  onTap: () => LoadDataController.instance.loadDataBannersPopup(context),
                ),

                /// -- Relationships
                const SizedBox(height: TSizes.spaceBtwSections),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(title: S.of(context).relationships, showActionButton: false),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Text(
                        S.of(context).subtitleRelationships,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TUploadDataTile(
                  icon: Iconsax.document_upload,
                  title: S.of(context).uploadBrandsCategories,
                  trailing: const Icon(Remix.upload_cloud_line,
                    size: 28, color: TColors.primary),
                  onTap: () => Get.to(() => const UploadRelationshipsBrands()),
                ),
                TUploadDataTile(
                  icon: Iconsax.document_upload,
                  title: S.of(context).uploadProductsCategories,
                  trailing: const Icon(Remix.upload_cloud_line,
                    size: 28, color: TColors.primary),
                  onTap: () => Get.to(() => const UploadRelationshipsProduct()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
