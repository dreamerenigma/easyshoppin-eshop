import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:easyshoppin_eshop/common/widgets/layouts/grid_layout.dart';
import 'package:easyshoppin_eshop/common/widgets/texts/section_heading.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/brand_controller.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/category_controller.dart';
import 'package:easyshoppin_eshop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:easyshoppin_eshop/utils/constants/colors.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import '../all_brands/all_brands.dart';
import '../all_brands/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// -- Appbar -- Tutorial [Section # 3, Video #7]
        appBar: TAppBar(
          title: Text(S.of(context).store, style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: NestedScrollView(
          /// -- Header -- Tutorial [Section # 3, Video # 7]
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// --- Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// -- Feature Brands
                      TSectionHeading(title: S.of(context).featureBrands, onPressed: () => Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      /// -- Brands GRID
                      Obx(
                        () {
                          if (brandController.isLoading.value) return const TBrandsShimmer();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text(S.of(context).noDataFound, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                            );
                          }

                          return TGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];

                              return TBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () => Get.to(() => BrandProducts(brand: brand)),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),

                /// Tabs -- Tutorial [Section # 3, Video # 8]
                bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },

          /// -- Body -- Tutorial [Section # 3, Video # 8]
          body: TabBarView(children: categories.map((category) => TCategoryTab(category: category)).toList()),
        ),
      ),
    );
  }
}
