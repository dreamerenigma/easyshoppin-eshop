import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/layouts/grid_layout.dart';
import 'package:easyshoppin_eshop/common/widgets/texts/section_heading.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/brand_controller.dart';
import 'package:easyshoppin_eshop/features/shop/screens/all_brands/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: TAppBar(title: Text(S.of(context).brand, style: TextStyle(fontSize: TSizes.fontSizeXl)), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Heading
            const SizedBox(height: TSizes.spaceBtwItems),
            TSectionHeading(title: (S.of(context).brands), showActionButton: false),
            /// -- Brands GRID
            Padding(
              padding: const EdgeInsets.all(TSizes.spaceBtwItemsSmall),
              child: Obx(
                () {
                  if (brandController.isLoading.value) return const TBrandsShimmer();

                  if (brandController.allBrands.isEmpty) {
                    return Center(child: Text(S.of(context).noDataFound, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)));
                  }

                  return TGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return TBrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
