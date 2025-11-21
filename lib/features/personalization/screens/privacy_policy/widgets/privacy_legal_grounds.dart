import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class PrivacyLegalGrounds extends StatelessWidget {
  const PrivacyLegalGrounds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '3.1.', S.of(context).carriedCompany),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '-', S.of(context).consentSubjectPersonal),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '-', S.of(context).internationalTreaty),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '-', S.of(context).executionAgreement),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '-', S.of(context).legitimateInterests),
        ],
      ),
    );
  }
}
