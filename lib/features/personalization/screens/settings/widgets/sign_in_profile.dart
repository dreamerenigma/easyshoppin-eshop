import 'package:easyshoppin_eshop/features/authentication/screens/login/login.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/information/about_application.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/information/information_client.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../privacy_policy/privacy_policy.dart';

class SignInProfile extends StatelessWidget {
  const SignInProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Header
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Lottie.asset(
                            TImages.loginAnimation,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        S.of(context).signInProfile,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        S.of(context).personalDiscounts,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        child: Text(S.of(context).buttonSignInProfile),
                        onPressed: () => Get.to(() => const LoginScreen()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          /// Information
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(text: S.of(context).aboutApplication,
                        style: const TextStyle(decoration: TextDecoration.none), recognizer: TapGestureRecognizer()..onTap = () {
                        Get.to(() => const AboutApplicationScreen());
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(text: S.of(context).informationClient,
                        style: const TextStyle(decoration: TextDecoration.none), recognizer: TapGestureRecognizer()..onTap = () {
                          Get.to(() => const InformationClientScreen());
                        }),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(text: S.of(context).privacyPolicy, style: const TextStyle(decoration: TextDecoration.none), recognizer: TapGestureRecognizer()..onTap = () {
                        Get.to(() => const PrivacyPolicyScreen());
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
