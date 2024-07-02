import 'package:easyshoppin_eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class RecommendationTechnologiesWidget extends StatelessWidget {
  const RecommendationTechnologiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextWithBoldOption(context, '', S.of(context).rulesRecommendationTechnologies, isBoldContent: true, fontSize: TSizes.fontSizeLg),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).informationResourceUses),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).informationResourceUsesRT),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).providingInformationRT),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).questionsAboutRecommendations),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).whatRecommendationSystem),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).modernToolRS),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).productsGeneratedRS),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).whatRecommendations),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).personalProductRecommendations),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).productRecommendationsHelp),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).whatStagesRecommendations),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).selectionProductsThrough),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).searchCandidateProducts, isBoldContent: true),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).systemSelectsProductsRelevant),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).personalizedRecommendations),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).likelihoodBecomingProduct),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).productRanking, isBoldContent: true),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).relevantProductsRanks),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).variousProductProperties),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).likelihoodPurchasingProduct),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).modelAnalyzesUser),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).logicDisplayingSelection),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).businessLogicDisplaying),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).receivedFinalRatings),
          const SizedBox(height: 8.0),
          buildRichTextWithBoldOption(context, '', S.of(context).selectionRecommendations),
        ],
      ),
    );
  }
}
