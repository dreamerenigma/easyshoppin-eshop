import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/screens/profile.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/storage_keys.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/controllers/login/login_controller.dart';

class UpdateChangePasswordController extends GetxController {
  static UpdateChangePasswordController get instance => Get.find();

  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  final hidePassword = true.obs;
  final hidePasswordConfirm = true.obs;
  final localStorage = GetStorage();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> updatePassword(BuildContext context) async {
    try {
      TFullScreenLoader.openLoadingDialog(S.of(context).updatingPassword, TImages.doerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!updatePasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      String hashedPassword = hashPassword(password.text.trim());
      Map<String, dynamic> passwordData = {'Password': hashedPassword};
      await userRepository.updateSingleField(passwordData);

      localStorage.write(StorageKeys.password, password.text.trim());

      final loginController = Get.find<LoginController>();
      loginController.password.text = password.text.trim();

      TFullScreenLoader.stopLoading();

      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        S.of(context).passwordBeenUpdated,
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

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordRequired;
    }

    if (value.length < 6) {
      return S.of(context).passwordCharactersLong;
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return S.of(context).passwordUppercaseLetter;
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return S.of(context).passwordOneNumber;
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return S.of(context).passwordSpecialCharacter;
    }

    return null;
  }

  static String? validatePasswordConfirm(BuildContext context, String? value, String? password) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordConfirmationRequired;
    }

    if (value != password) {
      return S.of(context).passwordsDoNotMatch;
    }

    return null;
  }

  static String? combinedPasswordConfirmValidator(BuildContext context, String? value, String? password) {
    String? validationResult = validatePassword(context, value);
    if (validationResult != null) return validationResult;
    return validatePasswordConfirm(context, value, password);
  }
}
