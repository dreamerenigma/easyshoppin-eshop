import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../routes/custom_page_route.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../login/login_screen.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(context, createPageRoute(const LoginScreen()));
        },
        style: TextButton.styleFrom(
          backgroundColor: TColors.transparent,
          foregroundColor: TColors.darkGrey,
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 1,
          shadowColor: TColors.transparent,
        ).copyWith(
          mouseCursor: WidgetStateProperty.all(SystemMouseCursors.basic),
        ),
        child: Text(S.of(context).skip, style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.black)),
      ),
    );
  }
}
