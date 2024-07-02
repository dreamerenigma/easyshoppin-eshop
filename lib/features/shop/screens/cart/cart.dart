import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/loaders/animation_loader.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/product/cart_controller.dart';
import 'package:easyshoppin_eshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:easyshoppin_eshop/features/shop/screens/checkout/checkout.dart';
import 'package:easyshoppin_eshop/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(S.of(context).cart,
            style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Obx(
        () {
          /// Nothing Found Widget
          final emptyWidget = Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TAnimationLoaderWidget(
                  text: '',
                  animation: TImages.cartAnimation,
                  showAction: false,
                  actionText: '',
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).cartEmpty,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.off(() => const NavigationMenu()),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  ),
                  child: Text(S.of(context).letsFillIt),
                ),
              ],
            ),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),

                  /// -- Items in Cart
                  child: TCartItems(),
              ),
            );
          }
        },
      ),

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
        ? const SizedBox()
        : Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Obx(() => Text('S.of(context).checkout \$${controller.totalCartPrice.value}')),
          ),
        ),
    );
  }
}
