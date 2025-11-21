import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/screens/profile.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/popups/loaders.dart';

class UpdatePhoneNumberController extends GetxController {
  static UpdatePhoneNumberController get instance => Get.find();
  final phoneNumber = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updatePhoneNumberFormKey = GlobalKey<FormState>();
  late String initialPhoneNumber;

  @override
  void onInit() {
    initializedPhoneNumber();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializedPhoneNumber() async {
    initialPhoneNumber = userController.user.value.phoneNumber;
    phoneNumber.text = initialPhoneNumber;
  }

  Future<void> updatePhoneNumber(BuildContext context) async {
    try {
      if (phoneNumber.text.trim() == initialPhoneNumber) {
        CustomIconSnackBar.showAnimatedSnackBar(
          context,
          S.of(context).dataNotBeenChanged,
          icon: const Icon(Icons.error_outline_outlined),
          iconColor: TColors.orange,
          backgroundColor: TColors.orange.withAlpha((0.5 * 255).toInt()),
        );
        return;
      }

      TFullScreenLoader.openLoadingDialog(S.of(context).updatingYourInfo, TImages.doerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!updatePhoneNumberFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'PhoneNumber': phoneNumber.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.phoneNumber = phoneNumber.text.trim();

      TFullScreenLoader.stopLoading();

      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        S.of(context).phoneNumberBeenUpdated,
        icon: const Icon(BootstrapIcons.phone),
        iconColor: TColors.blue,
        backgroundColor: TColors.blue.withAlpha((0.5 * 255).toInt()),
      );

      Get.off(() => const ProfileSettingScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        e.toString(),
        icon: const Icon(Iconsax.warning_2),
        iconColor: TColors.red,
        backgroundColor: TColors.red.withAlpha((0.5 * 255).toInt()),
      );
    }
  }
}
