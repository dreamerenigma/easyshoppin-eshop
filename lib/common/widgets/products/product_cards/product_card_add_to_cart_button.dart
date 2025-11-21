import 'package:easyshoppin_eshop/features/shop/controllers/product/cart_controller.dart';
import 'package:easyshoppin_eshop/features/shop/models/product_model.dart';
import 'package:easyshoppin_eshop/features/shop/screens/product_details/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  final ProductModel product;
  final bool showDialogOnRemove;

  const ProductCardAddToCartButton({super.key, required this.product, this.showDialogOnRemove = true});


  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(() {
      final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

      return InkWell(
        onTap: () {
          if (productQuantityInCart == 0) {
            final cartItem = cartController.convertToCartItem(product, 1);
            cartController.addOneToCart(cartItem);
          } else {
            Get.to(() => ProductDetailScreen(product: product));
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? TColors.primary : TColors.primary,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (productQuantityInCart > 0) ...[
                  GestureDetector(
                    onTap: () {
                      if (showDialogOnRemove) {
                        cartController.removeOneFromCartWithDialog(
                          cartController.cartItems.firstWhere(
                            (cartItem) => cartItem.productId == product.id, orElse: () => CartItemModel.empty(),
                          ),
                        );
                      } else {
                        cartController.removeOneFromCart(
                          cartController.cartItems.firstWhere(
                            (cartItem) => cartItem.productId == product.id, orElse: () => CartItemModel.empty(),
                          ),
                        );
                      }
                    },
                    child: const Icon(Iconsax.minus, color: TColors.white),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (productQuantityInCart == 0)
                        const Icon(Icons.shopping_cart_rounded, color: TColors.white, size: 20),
                      if (productQuantityInCart == 0)
                        const SizedBox(width: 8),
                      Text(
                        productQuantityInCart > 0 ? productQuantityInCart.toString() : '19 февраля',
                        style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd),
                      ),
                    ],
                  ),
                ),
                if (productQuantityInCart > 0) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      cartController.addOneToCart(
                        cartController.cartItems.firstWhere(
                          (cartItem) => cartItem.productId == product.id,
                          orElse: () => CartItemModel.empty(),
                        ),
                      );
                    },
                    child: const Icon(Iconsax.add, color: TColors.white),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    });
  }
}
