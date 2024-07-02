import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:easyshoppin_eshop/features/shop/screens/all_products/all_products.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header -- Tutorial [Section # 3, Video # 2]
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar -- Tutorial [Section # 3, Video # 3]
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- SearchBar -- Tutorial [Section # 3, Video # 4]
                  const TSearchContainer(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories -- Tutorial [Section # 3, Video # 4]
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        TSectionHeading(title: S.of(context).popularCategory, showActionButton: false, textColor: Colors.white),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        const THomeCategories(),
                      ],
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body -- Tutorial [Section # 3, Video # 5]
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider -- Tutorial [Section # 3, Video # 5]
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Heading
                  TSectionHeading(
                    title: S.of(context).popularCategory,
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: S.of(context).popularCategory,
                        query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6),
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Popular Products -- Tutorial [Section # 3, Video # 6]
                  Obx(() {
                    if (controller.isLoading.value) return const TVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text(S.of(context).noDataFound, style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
