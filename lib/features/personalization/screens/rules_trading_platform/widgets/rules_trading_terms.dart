import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingTerms extends StatelessWidget {
  const TRulesTradingTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '1.1.', S.of(context).tradingPlatformSearch),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Trading platform', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'The owner', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'User', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Seller', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Buyer', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Goods', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Personal Account', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Order pick-up', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Postamat', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Order', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Services', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Delivery of goods “to the door”', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Promotion', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Promotional discount', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Promotional code', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Promotional', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'ES Discount', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Balance', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Return of the Goods', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Chat', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Product card', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'Registration data', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, 'ES electronic wallet', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}