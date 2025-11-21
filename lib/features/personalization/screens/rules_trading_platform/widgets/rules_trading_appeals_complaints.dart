import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingAppealsComplaints extends StatelessWidget {
  const TRulesTradingAppealsComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '11.', S.of(context).tradingPlatformSearch),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.2.', S.of(context).usingTradingPlatform),
        ],
      ),
    );
  }
}
