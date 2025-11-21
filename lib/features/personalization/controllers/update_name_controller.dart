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

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  late String initialFirstLastName;

  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
    initialFirstLastName = '${userController.user.value.firstName} ${userController.user.value.lastName}';
  }

  Future<void> updateFirstLastName(BuildContext context) async {
    try {
      final currentFirstLastName = '${firstName.text.trim()} ${lastName.text.trim()}';
      if (currentFirstLastName == initialFirstLastName) {
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

      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();

      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        S.of(context).nameBeenUpdated,
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
