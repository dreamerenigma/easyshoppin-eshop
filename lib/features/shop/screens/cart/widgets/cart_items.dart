import 'package:easyshoppin_eshop/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/app_sizes.dart';

class TCartItems extends StatelessWidget {
  final bool showAddRemoveButton;

  const TCartItems({super.key, this.showAddRemoveButton = true});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, _) => const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                /// Cart Item
                TCartItem(cartItem: item),
                if (showAddRemoveButton)
                /// Add Remove Button Row with total Price
                if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),
                        /// Add Remove Buttons
                        TProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    /// -- Product total price
                    TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
