import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/app_colors.dart';
import 'animated_snackbar.dart';

class TLoaders {
  static void hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static void customToast({required String message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunctions.isDarkMode(Get.context!) ? TColors.darkerGrey.withAlpha((0.9 * 255).toInt()) : TColors.grey.withAlpha((0.9 * 255).toInt()),
          ),
          child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static void successSnackbar({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white),
    );
  }

  static void successClipBoard({required String title, String message = '', int duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.clipboard_tick, color: TColors.white),
    );
  }

  static void warningSnackBar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  static void errorSnackBar({String? title, String message = ''}) {
    Get.snackbar(
      title ?? "",
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }
}

class CustomIconSnackBar {
  static bool _isSnackBarVisible = false;

  static Future<void> showAnimatedSnackBar(
      BuildContext context,
      String message,
      {Widget? icon, Color? iconColor, Color? backgroundColor,
      }) async {
    if (_isSnackBarVisible) return;

    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;

    GlobalKey<AnimatedSnackBarState> snackBarKey = GlobalKey<AnimatedSnackBarState>();

    overlayEntry = OverlayEntry(
      builder: (context) {

        return Positioned(
          left: 16,
          right: 16,
          bottom: 20,
          child: AnimatedSnackBar(
            key: snackBarKey,
            message: message,
            icon: icon,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
          ),
        );
      },
    );

    overlayState.insert(overlayEntry);
    _isSnackBarVisible = true;

    await Future.delayed(const Duration(seconds: 4));

    if (snackBarKey.currentState != null) {
      await snackBarKey.currentState!.hideSnackBar();
    }

    overlayEntry.remove();
    _isSnackBarVisible = false;
  }
}
