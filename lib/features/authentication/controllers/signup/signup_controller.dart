import 'package:easyshoppin_eshop/data/repositories/authentication/authentication_repository.dart';
import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/signup/verify_email.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.doerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept privacy Policy',
          message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        password: password.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        gender: '',
        day: '',
        month: '',
        year: '',
        smsSubscribed: false,
        role: '',
        addresses: [],
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackbar(title: 'Congratulation', message: 'Your account has been created! Verify email to continue.');

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
