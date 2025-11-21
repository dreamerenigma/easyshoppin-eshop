import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/loaders/animation_loader.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/product/cart_controller.dart';
import 'package:easyshoppin_eshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:easyshoppin_eshop/features/shop/screens/checkout/checkout.dart';
import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:easyshoppin_eshop/navigation_menu.dart';
import 'package:easyshoppin_eshop/utils/platforms/platform_utils.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../personalization/screens/address/select_address_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    bool isNarrow = MediaQuery.of(context).size.width < 1040;

    String getItemCountText(int count) {
      if (count % 10 == 1 && count % 100 != 11) {
        return '$count товар';
      } else if (count % 10 >= 2 && count % 10 <= 4 &&
          (count % 100 < 10 || count % 100 >= 20)) {
        return '$count товара';
      } else {
        return '$count товаров';
      }
    }

    String formatNumberWithSpaces(String number) {
      final regExp = RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))');
      return number.replaceAllMapped(regExp, (match) => ' ');
    }

    return Scaffold(
      appBar: isWebOrWindows ? null : TAppBar(
        showBackArrow: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 10),
          child: Row(
            children: [
              Text(S.of(context).cart, style: TextStyle(fontSize: TSizes.fontSizeXl)),
              const SizedBox(width: 8),
              Obx(() =>
                Text(
                  getItemCountText(controller.noOfCartItems.value),
                  style: TextStyle(fontSize: TSizes.fontSizeBg, color: TColors.darkGrey, fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.to(() => const CheckoutScreen());
                },
                splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Text('Выбрать', style: TextStyle(color: TColors.blue, fontSize: TSizes.fontSizeSm)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwLittle, vertical: TSizes.spaceBtwLittle),
            child: InkWell(
              onTap: () {
                Get.to(() => const SelectAddressScreen());
              },
              splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
              highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
              borderRadius: BorderRadius.circular(TSizes.cardRadiusXs),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(S.of(context).selectAddress, style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400)),
                    const SizedBox(width: 4),
                    const Icon(EvaIcons.arrowIosDownwardOutline, size: TSizes.iconSm, color: TColors.darkGrey),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                final emptyWidget = Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TAnimationLoaderWidget(
                          text: '',
                          animation: TImages.cartAnimation,
                          showAction: false,
                          actionText: '',
                          widthFactor: 0.3,
                        ),
                        const SizedBox(height: 10),
                        Text(S.of(context).cartEmpty, style: TextStyle(fontSize: TSizes.fontSizeBg, fontWeight: FontWeight.w500)),
                        Text(
                          'Загляните на главную — собрали там товары, которые могут вам понравиться',
                          style: TextStyle(fontSize: TSizes.fontSizeMd),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        SizedBox(
                          width: isNarrow ? double.infinity : null,
                          child: ElevatedButton(
                            onPressed: () => Get.off(() => const NavigationMenu()),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: Text(S.of(context).letsFillIt, style: TextStyle(fontSize: TSizes.fontSizeMd)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                if (controller.cartItems.isEmpty) {
                  return emptyWidget;
                } else {
                  return ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: const SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems, vertical: TSizes.defaultSpace),
                        child: TCartItems(),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() : Padding(
        padding: const EdgeInsets.all(TSizes.spaceBtwItems),
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              padding: EdgeInsets.zero,
              elevation: 0,
              overlayColor: TColors.black.withAlpha((0.5 * 255).toInt()),
            ),
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Obx(() {
              final itemCount = controller.noOfCartItems.value;
              final totalPrice = controller.totalCartPrice.value;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).checkout, style: TextStyle(fontSize: TSizes.fontSizeMd)),
                  const SizedBox(height: 4),
                  Text('${formatNumberWithSpaces(itemCount.toString())} ${'шт.'} ${formatNumberWithSpaces(totalPrice.toString())} ₽',
                    style: TextStyle(color: TColors.buttonGrey, fontSize: TSizes.fontSizeMd),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
