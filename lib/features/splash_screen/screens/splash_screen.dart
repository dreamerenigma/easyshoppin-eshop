import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/features/authentication/screens/select_country/select_country.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../api/apis.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/platforms/platform_utils.dart';
import '../../shop/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: TColors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: TColors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (kIsWeb) {
      Future.delayed(const Duration(seconds: 3), () => _navigateToNextScreen());
      return;
    }

    Future.delayed(const Duration(seconds: 2), () => _navigateToNextScreen());
  }

  Future<void> _navigateToNextScreen() async {
    final user = APIs.auth.currentUser;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance.collection('Users').doc(user.uid).get();
      if (snapshot.exists) {
        Get.off(() => HomeScreen());
      } else {
        Get.off(() => const SelectCountryScreen());
      }
    } else {
      Get.off(() => const SelectCountryScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logoAsset = context.isDarkMode ? TImages.appLogoLight : TImages.appLogoDark;

    return Scaffold(
      backgroundColor: context.isDarkMode ? TColors.blackGrey : TColors.grey.withAlpha((0.7 * 255).toInt()),
      body: Stack(
        children: [
          if (isWebOrWindows) Center(child: Image.asset(logoAsset, width: mq.size.width * .15))
          else
            Positioned(
              top: mq.size.height * 0.35,
              left: 0,
              right: 0,
              child: Center(child: Image.asset(logoAsset, width: mq.size.width * .5)),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              minimum: const EdgeInsets.only(bottom: TSizes.defaultSpace),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).createIn, style: TextStyle(fontSize: TSizes.fontSizeSm, color: context.isDarkMode ? TColors.darkGrey : TColors.darkerGrey)),
                  Image.asset(TImages.logoIS, width: 150),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
