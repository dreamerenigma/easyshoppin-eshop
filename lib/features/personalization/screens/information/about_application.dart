import 'package:easyshoppin_eshop/features/personalization/screens/information/widgets/build_list_item.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/information/widgets/more_about_application.dart';
import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/login/login.dart';
import '../feedback/widgets/screen/feedback_screen.dart';
import '../legal_info/legal_information.dart';
import '../privacy_policy/privacy_policy.dart';
import '../recommendation_technologies/recommendation_techologies.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).aboutApplication,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  TImages.darkAppLogo,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      S.of(context).appName,
                      style: Theme.of(context).textTheme.headlineSmall!,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MoreAboutApplicationScreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          S.of(context).more,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: TSizes.fontSizeSm,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  _openWithDialog(context);
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                child: Text(
                  S.of(context).rateThisApp,
                  style: const TextStyle(
                    fontSize: TSizes.fontSizeMd,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildListItemWithGestureDetector(
                    text: S.of(context).feedback,
                    onTap: () {
                      handleNavigation(context);
                    },
                  ),
                  BuildListItemWithGestureDetector(
                    text: S.of(context).privacyPolicy,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
                      );
                    },
                  ),
                  BuildListItemWithGestureDetector(
                    text: S.of(context).legalInformation,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LegalInformationScreen()),
                      );
                    },
                  ),
                  BuildListItemWithGestureDetector(
                    text: S.of(context).recommendationTechnologies,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RecommendationTechnologiesScreen()),
                      );
                    },
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        S.of(context).copyRight,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openWithDialog(BuildContext context) {
    const AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.VIEW',
      data: 'market://details?id=com.inputstudios.easyshoppin',
    );

    intent.launch();
  }

  void handleNavigation(BuildContext context) {
    if (AuthenticationRepository.instance.isAuthenticated.value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FeedbackScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
