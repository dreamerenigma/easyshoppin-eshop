import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../utils/constants/rules_trading_platform_text_strings.dart';

class TRulesTradingRightsGuarantees extends StatelessWidget {
  const TRulesTradingRightsGuarantees({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '8.1.', TTextsRulesTrading.tradingPlatformSearch),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.2.', TTextsRulesTrading.usingTradingPlatform),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
