import 'package:easyshoppin_eshop/data/repositories/authentication/authentication_repository.dart';
import 'package:easyshoppin_eshop/data/repositories/user/user_repository.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/login/login_screen.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:easyshoppin_eshop/utils/popups/full_screen_loader.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  RxString userRole = ''.obs;

  var showCameraIcon = false.obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final fetchedUser = await userRepository.fetchUserDetails();
      user(fetchedUser);
      userRole.value = fetchedUser.role;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials, String password) async {
    try {

      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            password: password,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
            gender: '',
            day: '',
            month: '',
            year: '',
            smsSubscribed: false,
            role: 'user',
            addresses: [],
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Logout Warning
  void logoutWarningPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.center,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: THelperFunctions.isDarkMode(context) ? TColors.youngNight : TColors.light,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: THelperFunctions.isDarkMode(context) ? TColors.youngNight : TColors.light,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).loggingAccount, style: const TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(S.of(context).areYouSureYouWantToLogout),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: TColors.buttonDarkGrey,
                              side: BorderSide.none,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(S.of(context).cancel, style: TextStyle(fontSize: TSizes.fontSizeMd)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await AuthenticationRepository().logout();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: BorderSide.none,
                            ),
                            child: Text(S.of(context).logoutButton, style: TextStyle(fontSize: TSizes.fontSizeMd)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup(BuildContext context) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.bg),
      title: S.of(context).deleteAccount,
      middleText: S.of(context).deleteAccountMessage,
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? TColors.blackGrey : TColors.white,
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(context),
        style: ElevatedButton.styleFrom(backgroundColor: TColors.red, side: const BorderSide(color: TColors.red)),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: TSizes.xl), child: Text(S.of(context).delete)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text(S.of(context).cancel),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount(BuildContext context) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.doerAnimation);

      /// First re-authentication user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser?.providerData.map((e) => e.providerId).first;
      if (provider!.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      if (!context.mounted) return;
      TLoaders.warningSnackBar(title: S.of(context).ohSnap, message: e.toString());
    }
  }

  /// -- RE_AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser(BuildContext context) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.doerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();

      if (!context.mounted) return;
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: S.of(context).ohSnap, message: e.toString());
    }
  }

  /// Upload Profile Image
  Future<void> uploadUserProfilePicture(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        if (!context.mounted) return;
        TLoaders.successSnackbar(title: S.of(context).congratulations, message: S.of(context).imageUpdated);
      }
    } catch (e) {
      if (!context.mounted) return;
      TLoaders.errorSnackBar(title: S.of(context).ohSnap, message: '${S.of(context).somethingWentWrong}: $e');
    } finally {
      imageUploading.value = false;
      showCameraIcon.value = false;
    }
  }
}
