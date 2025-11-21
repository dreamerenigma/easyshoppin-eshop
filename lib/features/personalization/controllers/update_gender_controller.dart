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

class UpdateGenderController extends GetxController {
  static UpdateGenderController get instance => Get.find();
  var selectedGender = ''.obs;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateGenderFormKey = GlobalKey<FormState>();
  late String initialGender;

  @override
  void onInit() {
    initializeGender();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeGender() async {
    initialGender = userController.user.value.gender;
    selectedGender.value = initialGender;
  }

  Future<void> updateGender(BuildContext context) async {
    try {
      if (selectedGender.value == initialGender) {
        CustomIconSnackBar.showAnimatedSnackBar(
          context,
          S.of(context).dataNotBeenChangedOption,
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

      if (!updateGenderFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> updatedData = {'Gender': selectedGender.value};
      await userRepository.updateSingleField(updatedData);

      userController.user.value.gender = selectedGender.value;

      TFullScreenLoader.stopLoading();

      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        S.of(context).genderBeenUpdated,
        icon: const Icon(Iconsax.check),
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
