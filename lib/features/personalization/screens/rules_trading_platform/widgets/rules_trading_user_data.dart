import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingUserData extends StatelessWidget {
  const TRulesTradingUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '6.1.', S.of(context).processingUserData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.2.', S.of(context).userDataProcessedMarketplace),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.3.', S.of(context).userRightProvideUserData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.4.', S.of(context).dataProvidedUserReliable),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.5.', S.of(context).userAccessManageMarketingMessages),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.6.', S.of(context).userUnderstandsAgrees),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.7.', S.of(context).purposeCombatingFraud),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.8', S.of(context).stopProcessingUserData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.9.', S.of(context).tradingRecommendationTechnologies),
        ],
      ),
    );
  }
}
