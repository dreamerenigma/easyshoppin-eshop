import 'package:easyshoppin_eshop/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/app_colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.icon,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
    this.iconSize,
    required this.counter,
  });

  final int counter;
  final IconData? icon;
  final Color? iconColor, counterBgColor, counterTextColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          icon ?? Iconsax.shopping_cart,
          color: iconColor ?? Theme.of(context).iconTheme.color,
          size: iconSize ?? 24,
        ),
        Positioned(
          right: -8,
          top: -6,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ?? TColors.youngNight,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: counterTextColor ?? TColors.white,
                    fontSizeFactor: 0.8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
