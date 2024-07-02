import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/profile.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/constants/image_strings.dart';
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

  Future<void> updatePassword() async {
    try {
      TFullScreenLoader.openLoadingDialog('Updating your password...', TImages.doerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate form
      if (!updatePasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Hash the new password
      String hashedPassword = hashPassword(password.text.trim());
      Map<String, dynamic> passwordData = {'Password': hashedPassword};
      await userRepository.updateSingleField(passwordData);

      // Save the new password locally
      localStorage.write(StorageKeys.password, password.text.trim());

      // Update password in LoginController as well
      final loginController = Get.find<LoginController>();
      loginController.password.text = password.text.trim();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackbar(title: 'Congratulations', message: 'Your password has been updated.');
      Get.off(() => const ProfileSettingScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validatePasswordConfirm(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Password confirmation is required.';
    }

    if (value != password) {
      return 'Passwords do not match.';
    }

    return null;
  }

  static String? combinedPasswordConfirmValidator(String? value, String? password) {
    String? validationResult = validatePassword(value);
    if (validationResult != null) return validationResult;
    return validatePasswordConfirm(value, password);
  }
}
