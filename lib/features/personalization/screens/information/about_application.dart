import 'package:easyshoppin_eshop/features/personalization/screens/information/widgets/build_list_item.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/information/widgets/more_about_application.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../routes/custom_page_route.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../authentication/screens/login/login_screen.dart';
import '../feedback/widgets/screen/feedback_screen.dart';
import '../legal_info/legal_information.dart';
import '../privacy_policy/privacy_policy_screen.dart';
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
                Image.asset(TImages.appLogoDark, width: 120, height: 120),
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
                        Navigator.push(context, createPageRoute(const MoreAboutApplicationScreen()));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(S.of(context).more, style: const TextStyle(decoration: TextDecoration.none, fontSize: TSizes.fontSizeSm)),
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
                style: ButtonStyle(padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 16.0))),
                child: Text(S.of(context).rateThisApp, style: const TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold)),
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
                      Navigator.push(context, createPageRoute(const PrivacyPolicyScreen()));
                    },
                  ),
                  BuildListItemWithGestureDetector(
                    text: S.of(context).legalInformation,
                    onTap: () {
                      Navigator.push(context, createPageRoute(const LegalInformationScreen()));
                    },
                  ),
                  BuildListItemWithGestureDetector(
                    text: S.of(context).recommendationTechnologies,
                    onTap: () {
                      Navigator.push(context, createPageRoute(const RecommendationTechnologiesScreen()));
                    },
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(S.of(context).copyRight, style: Theme.of(context).textTheme.bodyMedium),
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


  void _openWithDialog(BuildContext context) async {
    final Uri uri = Uri.parse('market://details?id=com.inputstudios.easyshoppin');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      final Uri webUri = Uri.parse('https://play.google.com/store/apps/details?id=com.inputstudios.easyshoppin');
      if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Не удалось открыть магазин')),
        );
      }
    }
  }

  void handleNavigation(BuildContext context) {
    if (AuthenticationRepository.instance.isAuthenticated.value) {
      Navigator.push(context, createPageRoute(const FeedbackScreen()));
    } else {
      Navigator.push(context, createPageRoute(const LoginScreen()));
    }
  }
}
