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

class UpdateUserNameController extends GetxController {
  static UpdateUserNameController get instance => Get.find();
  final userName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  late String initialUserName;

  @override
  void onInit() {
    super.onInit();
    initializedNames();
  }

  /// Fetch user record
  Future<void> initializedNames() async {
    initialUserName = userController.user.value.username;
    userName.text = initialUserName;
  }

  Future<void> updateUserName(BuildContext context) async {
    if (userName.text.trim() == initialUserName) {
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

    Map<String, dynamic> name = {'Username': userName.text.trim()};
    await userRepository.updateSingleField(name);

    userController.user.value.username = userName.text.trim();

    TFullScreenLoader.stopLoading();

    CustomIconSnackBar.showAnimatedSnackBar(
      context,
      S.of(context).usernameBeenUpdated,
      icon: const Icon(Iconsax.check),
      iconColor: TColors.blue,
      backgroundColor: TColors.blue.withAlpha((0.5 * 255).toInt()),
    );

    Get.off(() => const ProfileSettingScreen());
  }
}
