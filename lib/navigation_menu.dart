import 'dart:io';
import 'package:easyshoppin_eshop/utils/constants/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:solar_icons/solar_icons.dart';
import 'common/widgets/products/cart/cart_menu_icon.dart';
import 'common/widgets/shimmers/shimmer.dart';
import 'generated/l10n/l10n.dart';
import 'providers/navigation_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/utils/constants/app_images.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final userController = Get.find<UserController>();
    final darkMode = THelperFunctions.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;
    final showMenu = !(Platform.isWindows && width >= 1040);

    return Scaffold(
      bottomNavigationBar: showMenu
        ? Obx(() => Container(
          decoration: BoxDecoration(
            color: TColors.white,
            boxShadow: [
              BoxShadow(
                color: TColors.black.withAlpha((0.2 * 255).toInt()),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: NavigationBar(
              height: 70,
              elevation: 0,
              selectedIndex: navigationController.selectedIndex.value,
              onDestinationSelected: (index) => navigationController.selectedIndex.value = index,
              backgroundColor: darkMode ? TColors.youngNight : TColors.white,
              indicatorColor: darkMode ? TColors.white.withAlpha((0.1 * 255).toInt()) : TColors.youngNight.withAlpha((0.1 * 255).toInt()),
              destinations: [
                NavigationDestination(
                  icon: const HeroIcon(HeroIcons.home),
                  selectedIcon: const Icon(Icons.home, size: 28),
                  label: S.of(context).home,
                ),
                NavigationDestination(
                  icon: const Icon(Iconsax.shop),
                  selectedIcon: const Icon(SolarIconsBold.shop, size: 28),
                  label: S.of(context).store,
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(
                    TVectors.tag,
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(darkMode ? TColors.white : TColors.black, BlendMode.srcIn),
                  ),
                  selectedIcon: const Icon(FontAwesomeIcons.tag, size: 26),
                  label: S.of(context).stock,
                ),
                Obx(() => navigationController.isConnected.value ? NavigationDestination(
                    icon: TCartCounterIcon(
                      iconColor: darkMode ? TColors.white : TColors.black,
                      counterBgColor: darkMode ? TColors.white : TColors.black,
                      counterTextColor: darkMode ? TColors.black : TColors.white,
                      counter: navigationController.cartItemCount.value,
                    ),
                    selectedIcon: TCartCounterIcon(
                      icon: Iconsax.shopping_cart5,
                      iconSize: 24,
                      iconColor: darkMode ? TColors.white : TColors.black,
                      counterBgColor: darkMode ? TColors.white : TColors.black,
                      counterTextColor: darkMode ? TColors.black : TColors.white,
                      counter: navigationController.cartItemCount.value,
                    ),
                    label: S.of(context).cart,
                  ) : NavigationDestination(icon: const Icon(Iconsax.shopping_cart), label: S.of(context).cart),
                ),
                Obx(
                  () => navigationController.isConnected.value
                    ? NavigationDestination(
                    icon: Obx(
                          () {
                        final networkImage = userController.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                        return userController.imageUploading.value ? const TShimmerEffect(width: 30, height: 30, radius: 30) :
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: networkImage.isNotEmpty ? NetworkImage(image) : const AssetImage(TImages.user) as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    label: S.of(context).profile,
                  ) : NavigationDestination(icon: const Icon(Iconsax.user), label: S.of(context).profile),
                )
              ],
            ),
        ),
      ) : null,
      body: Obx(() => navigationController.getScreen(navigationController.selectedIndex.value)),
    );
  }
}
