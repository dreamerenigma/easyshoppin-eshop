import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_data_birth.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_gender.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_password.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/constants/app_images.dart';
import 'package:easyshoppin_eshop/utils/constants/app_sizes.dart';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_username.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:easyshoppin_eshop/common/widgets/texts/section_heading.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../utils/widgets/no_glow_scroll_behavior.dart';
import '../../../controllers/user_controller.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  String maskPassword(String password) {
    return '*' * password.length;
  }

  String formatDate(String day, String month, String year, BuildContext context) {
    final List<String> months = [
      S.of(context).jan, S.of(context).feb, S.of(context).mar, S.of(context).apr, S.of(context).may, S.of(context).jun,
      S.of(context).jul, S.of(context).aug, S.of(context).sep, S.of(context).oct, S.of(context).nov, S.of(context).dec
    ];

    int monthIndex = int.tryParse(month) ?? 1;
    String formattedMonth = months[monthIndex - 1];

    return '$day $formattedMonth, $year';
  }

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(S.of(context).profile, style: TextStyle(fontSize: TSizes.fontSizeXl)),
        backArrowColor: Theme.of(context).iconTheme.color,
      ),
      /// -- Body
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Profile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                        return controller.imageUploading.value ? const TShimmerEffect(width: 80, height: 80, radius: 80) : GestureDetector(
                          onTap: () {
                            controller.showCameraIcon.value = !controller.showCameraIcon.value;
                            controller.uploadUserProfilePicture(context);
                          },
                          onLongPress: () {
                            controller.showCameraIcon.value = true;
                          },
                          onLongPressUp: () {
                            controller.showCameraIcon.value = false;
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: networkImage.isNotEmpty ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (controller.showCameraIcon.value)
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: TColors.youngNight.withAlpha((0.5 * 255).toInt()),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Iconsax.camera, color: TColors.white),
                                ),
                            ],
                          ),
                        );
                      }),
                      TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(context),
                        style: TextButton.styleFrom(
                          foregroundColor: TColors.accent.withAlpha((0.1 * 255).toInt()),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(S.of(context).changeProfilePicture, style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.accent)),
                      ),
                    ],
                  ),
                ),
                /// Details
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                /// Heading Profile Info
                TSectionHeading(title: S.of(context).profileInformation, showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                TProfileMenu(
                  title: S.of(context).name,
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
                TProfileMenu(
                  title: S.of(context).username,
                  value: controller.user.value.username,
                  onPressed: () => Get.to(() => const ChangeUsername())),
                TProfileMenu(
                  title: S.of(context).password,
                  value: controller.user.value.password,
                  onPressed: () => Get.to(() => const ChangePassword()),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                /// Heading Personal Info
                TSectionHeading(title: S.of(context).personalInformation, showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                TProfileMenu(
                  title: S.of(context).userId,
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: controller.user.value.id));
                    CustomIconSnackBar.showAnimatedSnackBar(
                      context,
                      S.of(context).userIdCopied,
                      icon: const Icon(Iconsax.clipboard_tick),
                      iconColor: TColors.primary,
                      backgroundColor: TColors.blue.withAlpha((0.5 * 255).toInt())
                    );
                  },
                ),
                TProfileMenu(title: S.of(context).email, value: controller.user.value.email, onPressed: () {}),
                TProfileMenu(title: S.of(context).phoneNumber, value: controller.user.value.phoneNumber, onPressed: () => Get.to(() => const ChangePhoneNumber())),
                TProfileMenu(title: S.of(context).gender, value: controller.user.value.gender, onPressed: () => Get.to(() => const ChangeGender())),
                TProfileMenu(
                  title: S.of(context).dateBirth,
                  value: formatDate(controller.user.value.day, controller.user.value.month, controller.user.value.year, context),
                  onPressed: () => Get.to(() => const ChangeDataBirth()),
                ),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(context),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: TSizes.spaceBtwLittle, vertical: TSizes.spaceBtwLittle),
                      foregroundColor: TColors.softGrey,
                      overlayColor: TColors.red.withAlpha((0.1 * 255).toInt()),
                      textStyle: TextStyle(fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.normal),
                    ),
                    child: Text(S.of(context).deleteAccount, style: const TextStyle(color: TColors.red)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
