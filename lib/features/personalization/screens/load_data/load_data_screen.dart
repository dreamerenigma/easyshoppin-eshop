import 'package:carbon_icons/carbon_icons.dart';
import 'package:easyshoppin_eshop/common/widgets/list_tiles/upload_data_tile.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/load_data/widgets/upload_relationships_brands.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/load_data/widgets/upload_relationships_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:remixicon/remixicon.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../controllers/widgets/dialogs/load_banners_dialog.dart';
import '../../controllers/widgets/dialogs/load_data_brands_dialog.dart';
import '../../controllers/widgets/dialogs/load_data_categories_dialog.dart';
import '../../controllers/widgets/dialogs/load_data_products_dialog.dart';
import '../../controllers/widgets/dialogs/load_data_sales_dialog.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// AppBar
            TAppBar(
              title: Text(S.of(context).uploadData, style: const TextStyle(fontSize: TSizes.fontSizeXl)),
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
                  trailing: const Icon(Remix.upload_cloud_line, size: 28, color: TColors.primary),
                  onTap: () => loadDataCategoriesDialog(context),
                ),
                TUploadDataTile(
                  icon: Iconsax.heart_tick4,
                  title: S.of(context).uploadBrands,
                  trailing: const Icon(Remix.upload_cloud_line, size: 28, color: TColors.primary),
                  onTap: () => loadDataBrandsDialog(context),
                ),
                TUploadDataTile(
                  icon: CarbonIcons.product,
                  title: S.of(context).uploadProducts,
                  trailing: const Icon(Remix.upload_cloud_line, size: 28, color: TColors.primary),
                  onTap: () => loadDataProductsDialog(context),
                ),
                TUploadDataTile(
                  icon: Ionicons.image_outline,
                  title: S.of(context).uploadBanners,
                  trailing: const Icon(Remix.upload_cloud_line, size: 28, color: TColors.primary),
                  onTap: () => loadDataBannersDialog(context),
                ),
                TUploadDataTile(
                  icon: SolarIconsOutline.saleSquare,
                  title: S.of(context).uploadSales,
                  trailing: const Icon(Remix.upload_cloud_line, size: 28, color: TColors.primary),
                  onTap: () => loadDataSalesDialog(context),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            const Icon(Icons.warning_amber_rounded, color: TColors.orange, size: 20),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                S.of(context).subtitleRelationships,
                                style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.orange),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TUploadDataTile(
                  icon: Iconsax.document_upload,
                  title: S.of(context).uploadBrandsCategories,
                  trailing: const Icon(Remix.upload_cloud_line, size: 28, color: TColors.primary),
                  onTap: () => Get.to(() => const UploadRelationshipsBrands()),
                ),
                TUploadDataTile(
                  icon: Iconsax.document_upload,
                  title: S.of(context).uploadProductsCategories,
                  trailing: const Icon(Remix.upload_cloud_line, size: 28, color: TColors.primary),
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
