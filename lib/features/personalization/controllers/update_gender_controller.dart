import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/profile.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';

class UpdateGenderController extends GetxController {
  static UpdateGenderController get instance => Get.find();

  var selectedGender = ''.obs;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateGenderFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeGender();
    super.onInit();
  }

  Future<void> initializeGender() async {
    selectedGender.value = userController.user.value.gender;
  }

  Future<void> updateGender() async {
    try {
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.doerAnimation);

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

      TLoaders.successSnackbar(title: 'Congratulation', message: 'Your gender has been updated.');

      Get.off(() => const ProfileSettingScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
