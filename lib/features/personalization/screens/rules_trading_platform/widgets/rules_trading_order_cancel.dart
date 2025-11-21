import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingOrderCancel extends StatelessWidget {
  const TRulesTradingOrderCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '9.1.', S.of(context).tradingPlatformSearch),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.2.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.3.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.4.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.5.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.6.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.7.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.8.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.9.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.10.', S.of(context).usingTradingPlatform),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '9.11.', S.of(context).usingTradingPlatform),
        ],
      ),
    );
  }
}
