import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:easyshoppin_eshop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:easyshoppin_eshop/common/widgets/texts/section_heading.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/currency_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/address.dart';
import 'package:easyshoppin_eshop/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/profile.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/themes_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/language_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/chats.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/coupon.dart';
import 'package:easyshoppin_eshop/features/shop/screens/order/order.dart';
import 'package:easyshoppin_eshop/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mdi/mdi.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/other_settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/image_quality_controller.dart';
import '../../controllers/payment_methods_controller.dart';
import '../../controllers/safe_mode_controller.dart';
import '../devices/devices.dart';
import '../geolocation/widget/geolocation_switch_wrapper.dart';
import '../information/about_application.dart';
import '../load_data/load_data.dart';
import '../notifications/notification.dart';
import '../notifications/widgets/notification_settings.dart';
import '../privacy_policy/privacy_policy.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '../rules_trading_platform/rules_trading_platform.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    final themesController = Get.put(ThemesController());
    final paymentController = Get.put(PaymentMethodsController());
    final imageQualityController = Get.put(ImageQualityController());
    final safeModeController = Get.put(SafeModeController());
    final currencyController = Get.put(CurrencyController());
    final userController = Get.put(UserController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  TAppBar(
                    title: Row(
                      children: [
                        Text(
                          S.of(context).profileSettings,
                          style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Iconsax.notification, color: TColors.white),
                          onPressed: () => Get.to(() => const NotificationScreen()),
                        ),
                      ],
                    ),
                    showBackArrow: false,
                    backArrowColor: TColors.white,
                  ),

                  /// User Profile Card
                  TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileSettingScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// -- Basic Settings
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                        title: S.of(context).basicSettings, showActionButton: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: S.of(context).addresses,
                  subTitle: S.of(context).subtitleAddresses,
                  onTap: () => Get.to(() => const UserAddressScreen())),
                TSettingsMenuTile(
                  icon: Iconsax.heart_tick4,
                  title: S.of(context).favourite,
                  subTitle: S.of(context).subtitleFavourite,
                  onTap: () => Get.to(() => const FavouriteScreen())),
                TSettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: S.of(context).orders,
                  subTitle: S.of(context).subtitleOrders,
                  onTap: () => Get.to(() => const OrderScreen())),
                TSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: S.of(context).paymentMethods,
                  subTitle: S.of(context).subtitlePaymentMethods,
                  onTap: () => paymentController.selectPaymentMethods(context)),
                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: S.of(context).coupons,
                  subTitle: S.of(context).subtitleCoupons,
                  onTap: () => Get.to(() => const CouponScreen())),
                TSettingsMenuTile(
                  icon: Icons.star_border,
                  title: S.of(context).productReviews,
                  subTitle: S.of(context).subtitleProductReviews),
                TSettingsMenuTile(
                  icon: Iconsax.shop,
                  title: S.of(context).favouriteStores,
                  subTitle: S.of(context).subtitleFavouriteStores),
                TSettingsMenuTile(
                  icon: BootstrapIcons.chat_right_dots,
                  title: S.of(context).chats,
                  subTitle: S.of(context).subtitleChats,
                  onTap: () => Get.to(() => const ChatsScreen())),

                /// -- Settings
                const SizedBox(height: TSizes.spaceBtwSections),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                        title: S.of(context).settings, showActionButton: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TSettingsMenuTile(
                  icon: Iconsax.document_upload,
                  title: S.of(context).loadData,
                  subTitle: S.of(context).subtitleLoadData,
                  onTap: () => Get.to(() => const LoadData())),
                TSettingsMenuTile(
                  icon: Iconsax.user,
                  title: S.of(context).personalData,
                  subTitle: S.of(context).subtitlePersonalData,
                  onTap: () => Get.to(() => const ProfileSettingScreen())),
                TSettingsMenuTile(
                  icon: Iconsax.location,
                  title: S.of(context).geolocation,
                  subTitle: S.of(context).subtitleGeolocation,
                  trailing: const GeolocationSwitchWrapper(),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: S.of(context).safeMode,
                  subTitle: S.of(context).subtitleSafeMode,
                  trailing: Obx(() {
                    return Switch(
                      value: safeModeController.isSafeModeEnabled.value,
                      onChanged: (value) {
                        safeModeController.toggleSafeMode(value);
                      },
                    );
                  }),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: S.of(context).imageQuality,
                  subTitle: S.of(context).subtitleImageQuality,
                  trailing: Obx(() {
                    return Switch(
                      value: imageQualityController.isHDEnabled.value,
                      onChanged: (value) {
                        imageQualityController.toggleHD(value);
                      },
                    );
                  }),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: S.of(context).notifications,
                  subTitle: S.of(context).subtitleNotifications,
                  onTap: () => Get.to(() => const NotificationSettingsScreen()),
                ),
                TSettingsMenuTile(
                  icon: Mdi.themeLightDark,
                  title: S.of(context).themes,
                  subTitle: S.of(context).subtitleThemes,
                  onTap: () => themesController.selectThemes(context),
                ),
                TSettingsMenuTile(
                  icon: Ionicons.language_outline,
                  title: S.of(context).language,
                  subTitle: S.of(context).subtitleLanguage,
                  onTap: () => languageController.selectLanguage(context),
                ),
                TOtherSettingsMenuTileMenuTile(
                    icon: FontAwesomeIcons.moneyBill1,
                    title: S.of(context).currencyPrices,
                    currencyController: currencyController,
                ),
                TSettingsMenuTile(
                  icon: Iconsax.devices_13,
                  title: S.of(context).yourDevices,
                  subTitle: S.of(context).subtitleYourDevices,
                  onTap: () => Get.to(() => const DevicesScreen()),
                ),

                /// Information
                const SizedBox(height: TSizes.spaceBtwSections),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                        title: S.of(context).information, showActionButton: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TSettingsMenuTile(
                  icon: Symbols.support_agent,
                  title: S.of(context).support,
                  subTitle: S.of(context).subtitleSupport,
                  onTap: () => Get.to(() => const ChatsScreen()),
                ),
                TSettingsMenuTile(
                  icon: Symbols.point_of_sale,
                  title: S.of(context).becomeSeller,
                  subTitle: S.of(context).subtitleBecomeSeller),
                TSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: S.of(context).accountPrivacy,
                  subTitle: S.of(context).subtitleAccountPrivacy,
                  onTap: () => Get.to(() => const PrivacyPolicyScreen())),
                TSettingsMenuTile(
                    icon: CarbonIcons.rule,
                    title: S.of(context).rulesUsingTradingPlatform,
                    subTitle: S.of(context).subtitleRulesUsingTradingPlatform,
                    onTap: () => Get.to(() => const TRulesTradingPlatformScreen())),
                TSettingsMenuTile(
                  icon: CarbonIcons.information,
                  title: S.of(context).aboutApplication,
                  subTitle: S.of(context).subtitleAboutApplication,
                  onTap: () => Get.to(() => const AboutApplicationScreen())),
                /// Logout Button
                const SizedBox(height: TSizes.spaceBtwSections),
                TSettingsMenuTile(
                  icon: Icons.exit_to_app, // Use the appropriate icon for your project
                  title: S.of(context).logout,
                  subTitle: '',
                  onTap: () => userController.logoutWarningPopup(context),
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
