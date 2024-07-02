import 'package:easyshoppin_eshop/features/personalization/screens/privacy_policy/widgets/privacy_categories_personal_data_processed.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/privacy_policy/widgets/privacy_generation_provision.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/privacy_policy/widgets/privacy_legal_grounds.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/privacy_policy/widgets/privacy_produce_conditions.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/privacy_policy/widgets/privacy_purposes_personal_data.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/privacy_policy/widgets/privacy_response_requests.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import '../rules_trading_platform/widgets/animated_expansion_tile.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  PrivacyPolicyScreenState createState() => PrivacyPolicyScreenState();
}

class PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).privacyPolicy,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AnimatedExpansionTile(
              title: S.of(context).generalProvisionsPrivacy,
              children: const [PrivacyGenerationProvision()],
            ),
            const Divider(),
            AnimatedExpansionTile(
              title: S.of(context).purposesPersonalData,
              children: const [PrivacyPurposesPersonalData()],
            ),
            const Divider(),
            AnimatedExpansionTile(
              title: S.of(context).legalGrounds,
              children: const [PrivacyLegalGrounds()],
            ),
            const Divider(),
            AnimatedExpansionTile(
              title: S.of(context).categoriesProcessed,
              children: const [PrivacyCategoriesPersonalDataProcessed()],
            ),
            const Divider(),
            AnimatedExpansionTile(
              title: S.of(context).procedureConditions,
              children: const [PrivacyProduceConditions()],
            ),
            const Divider(),
            AnimatedExpansionTile(
              title: S.of(context).responsesRequests,
              children: const [PrivacyResponseRequests()],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
