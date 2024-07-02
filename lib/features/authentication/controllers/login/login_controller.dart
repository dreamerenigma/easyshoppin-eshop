import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:easyshoppin_eshop/data/repositories/authentication/authentication_repository.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/storage_keys.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    final storedEmail = localStorage.read(StorageKeys.email);
    final storedPassword = localStorage.read(StorageKeys.password);

    if (storedEmail != null) {
      email.text = storedEmail;
    }

    if (storedPassword != null) {
      password.text = storedPassword;
    }

    super.onInit();
  }

  String hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to bytes
    final digest = sha256.convert(bytes); // Use SHA-256 hashing
    return digest.toString(); // Convert to string representation
  }

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn(BuildContext context) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(S.of(context).loggingYouIn, TImages.doerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(), // Use updated password here
      );

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write(StorageKeys.email, email.text.trim());
        localStorage.write(StorageKeys.password, password.text.trim());
      }

      // Save User Record
      await userController.saveUserRecord(userCredentials, password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn(BuildContext context) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(S.of(context).loggingYouIn, TImages.doerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      // Assuming the password is empty for Google sign-in
      await userController.saveUserRecord(userCredentials, '');

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
