import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/screens/profile.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/popups/loaders.dart';

class UpdateDateBirthController extends GetxController {
  static UpdateDateBirthController get instance => Get.find();
  var selectedDay = ''.obs;
  var selectedMonth = ''.obs;
  var selectedYear = ''.obs;
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateDateBirthFormKey = GlobalKey<FormState>();
  late String initialDateBirth;

  @override
  void onInit() {
    initializeDateBirth();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeDateBirth() async {
    selectedDay.value = userController.user.value.day;
    selectedMonth.value = userController.user.value.month;
    selectedYear.value = userController.user.value.year;
    initialDateBirth = '${userController.user.value.day} ${userController.user.value.month} ${userController.user.value.year}';
  }

  Future<void> updateDateBirth(BuildContext context) async {
    try {
      final currentFirstLastName = '${selectedDay.value} ${selectedMonth.value} ${selectedYear.value}';
      if (currentFirstLastName == initialDateBirth) {
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

      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        S.of(context).dateBirthBeenUpdated,
        icon: Icon(LineAwesomeIcons.birthday_cake_solid),
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
