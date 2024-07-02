import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/icons/t_circular_icon.dart';
import 'package:easyshoppin_eshop/common/widgets/layouts/grid_layout.dart';
import 'package:easyshoppin_eshop/common/widgets/loaders/animation_loader.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/product/favourite_controller.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/home.dart';
import 'package:easyshoppin_eshop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(S.of(context).wishlist, style: const TextStyle(fontSize: TSizes.fontSizeBg)),
        showBackArrow: true,
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          /// Products Grid
          child: Obx(
            () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                /// Nothing Found Widget
                final emptyWidget = Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TAnimationLoaderWidget(
                        text: '',
                        animation: TImages.favoriteAnimation,
                        showAction: false,
                        actionText: '',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        S.of(context).wishlistEmpty,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Get.off(() => const NavigationMenu()),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        ),
                        child: Text(S.of(context).letsAddSome),
                      ),
                    ],
                  ),
                );

                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget, context: context);
                if (widget != null) return widget;

                final products = snapshot.data!;
                return TGridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}
