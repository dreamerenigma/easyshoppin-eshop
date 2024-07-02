import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/profile.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';

class UpdateDateBirthController extends GetxController {
  static UpdateDateBirthController get instance => Get.find();

  var selectedDay = ''.obs;
  var selectedMonth = ''.obs;
  var selectedYear = ''.obs;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateDateBirthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeDateBirth();
    super.onInit();
  }

  Future<void> initializeDateBirth() async {
    // Assuming the user has date of birth fields in user model
    selectedDay.value = userController.user.value.day;
    selectedMonth.value = userController.user.value.month;
    selectedYear.value = userController.user.value.year;
  }

  Future<void> updateDateBirth() async {
    try {
      TFullScreenLoader.openLoadingDialog('We are updating your information...', TImages.doerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!updateDateBirthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> updatedData = {
        'Day': selectedDay.value,
        'Month': selectedMonth.value,
        'Year': selectedYear.value,
      };
      await userRepository.updateSingleField(updatedData);

      userController.user.value.day = selectedDay.value;
      userController.user.value.month = selectedMonth.value;
      userController.user.value.year = selectedYear.value;

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackbar(title: 'Congratulation', message: 'Your date of birth has been updated.');

      Get.off(() => const ProfileSettingScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
