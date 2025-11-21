import 'package:flutter/material.dart';
import '../../../../../features/shop/models/cart_item_model.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/popups/loaders.dart';

void removeProductDialog(BuildContext context, int index, List<CartItemModel> cartItems, Function updateCart) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Align(
          alignment: Alignment.center,
          child: Material(
            borderRadius: BorderRadius.circular(12),
            color: THelperFunctions.isDarkMode(context) ? TColors.youngNight : TColors.light,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: THelperFunctions.isDarkMode(context) ? TColors.youngNight : TColors.light,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Удалить товар из корзины', style: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text('Вы уверены, что хотите удалить этот продукт из корзины?', style: TextStyle(fontSize: TSizes.fontSizeSm)),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: TColors.buttonDarkGrey,
                            elevation: 0,
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            overlayColor: THelperFunctions.isDarkMode(context) ? TColors.black.withAlpha((0.5 * 255).toInt()) : TColors.dark.withAlpha((0.5 * 255).toInt()),
                          ),
                          child: Text('Нет'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            cartItems.removeAt(index);
                            updateCart();
                            CustomIconSnackBar.showAnimatedSnackBar(
                              context,
                              'Товар удален из корзины.',
                              icon: const Icon(Icons.check_circle_outline_rounded),
                              iconColor: TColors.check,
                              backgroundColor: TColors.check.withAlpha((0.5 * 255).toInt()),
                            );
                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: TColors.red.withAlpha((0.1 * 255).toInt()),
                            elevation: 0,
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            overlayColor: THelperFunctions.isDarkMode(context) ? TColors.black.withAlpha((0.5 * 255).toInt()) : TColors.dark.withAlpha((0.5 * 255).toInt()),
                          ),
                          child: Text('Удалить', style: TextStyle(color: TColors.red)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
