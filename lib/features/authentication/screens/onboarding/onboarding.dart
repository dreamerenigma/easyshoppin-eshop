import 'package:easyshoppin_eshop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/l10n/l10n.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: S.of(context).onBoardingTitle1,
                subTitle: S.of(context).onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: S.of(context).onBoardingTitle2,
                subTitle: S.of(context).onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: S.of(context).onBoardingTitle3,
                subTitle: S.of(context).onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
