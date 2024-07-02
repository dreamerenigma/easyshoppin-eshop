import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:easyshoppin_eshop/utils/constants/colors.dart';
import 'common/widgets/products/cart/cart_menu_icon.dart';
import 'common/widgets/shimmers/shimmer.dart';
import 'generated/l10n/l10n.dart';
import 'providers/navigation_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final userController = Get.find<UserController>();

    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) =>
          navigationController.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(
              icon: const HeroIcon(HeroIcons.home), label: S.of(context).home,
            ),
            NavigationDestination(
                icon: const Icon(Iconsax.shop), label: S.of(context).store),
            NavigationDestination(
                icon: const Icon(Iconsax.tag), label: S.of(context).stock),
            Obx(
              () => navigationController.isConnected.value
                  ? NavigationDestination(
                icon: TCartCounterIcon(
                  iconColor: darkMode ? Colors.white : Colors.black,
                  counterBgColor:
                  darkMode ? Colors.white : Colors.black,
                  counterTextColor:
                  darkMode ? Colors.black : Colors.white,
                  counter: navigationController.cartItemCount.value,
                ),
                label: S.of(context).cart,
              )
                  : NavigationDestination(
                  icon: const Icon(Iconsax.shopping_cart),
                  label: S.of(context).cart),
            ),
            Obx(
              () => navigationController.isConnected.value
                ? NavigationDestination(
                icon: Obx(
                      () {
                    final networkImage = userController.user.value.profilePicture;
                    final image = networkImage.isNotEmpty
                        ? networkImage
                        : TImages.user;
                    return userController.imageUploading.value
                        ? const TShimmerEffect(
                        width: 30, height: 30, radius: 30)
                        : Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: networkImage.isNotEmpty
                            ? NetworkImage(image)
                            : const AssetImage(
                            TImages.user) as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                label: S.of(context).profile,
              )
                  : NavigationDestination(
                icon: const Icon(Iconsax.user),
                label: S.of(context).profile,
              ),
            )
          ],
        ),
      ),
      body: Obx(() => navigationController
          .getScreen(navigationController.selectedIndex.value)),
    );
  }
}

