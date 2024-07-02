import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_data_birth.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_gender.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_password.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';
import 'package:easyshoppin_eshop/utils/constants/sizes.dart';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/change_username.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:easyshoppin_eshop/common/widgets/texts/section_heading.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../controllers/user_controller.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  String maskPassword(String password) {
    return '*' * password.length;
  }

  String formatDate(String day, String month, String year) {
    final List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
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
        title: Text(
          S.of(context).profile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backArrowColor: Theme.of(context).iconTheme.color,
      ),

      /// -- Body
      body: SingleChildScrollView(
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
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                          : GestureDetector(
                        onTap: () {
                          controller.showCameraIcon.value = !controller.showCameraIcon.value;
                          controller.uploadUserProfilePicture();
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
                                  image: networkImage.isNotEmpty
                                      ? NetworkImage(image)
                                      : AssetImage(image) as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (controller.showCameraIcon.value)
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Iconsax.camera,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: Text(S.of(context).changeProfilePicture),
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    TLoaders.successClipBoard(title: S.of(context).copy, message: S.of(context).userIdCopied),
                  );
                },
              ),
              TProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: () {}),
              TProfileMenu(title: S.of(context).phoneNumber, value: controller.user.value.phoneNumber, onPressed: () => Get.to(() => const ChangePhoneNumber())),
              TProfileMenu(title: S.of(context).gender, value: controller.user.value.gender, onPressed: () => Get.to(() => const ChangeGender())),
              TProfileMenu(
                title: S.of(context).dateBirth,
                value: formatDate(controller.user.value.day, controller.user.value.month, controller.user.value.year),
                onPressed: () => Get.to(() => const ChangeDataBirth()),
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(context),
                  child: Text(S.of(context).deleteAccount, style: const TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
