import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/brands/brand_card.dart';
import 'package:easyshoppin_eshop/common/widgets/products/sortable/sortable_products.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/brand_controller.dart';
import 'package:easyshoppin_eshop/features/shop/models/brand_model.dart';
import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:easyshoppin_eshop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/app_sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name, style: TextStyle(fontSize: TSizes.fontSizeXl)), showBackArrow: true),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Brand Detail
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItemsSmall),
                child: TBrandCard(showBorder: true, brand: brand),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  /// Handle Loader, No Record, OR Error Message
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, context: context);

                  if (widget != null) return widget;

                  /// Record Found!
                  final brandProducts = snapshot.data!;
                  return TSortableProducts(products: brandProducts);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
