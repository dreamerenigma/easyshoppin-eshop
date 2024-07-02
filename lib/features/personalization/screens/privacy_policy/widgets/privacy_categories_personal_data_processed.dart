import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class PrivacyCategoriesPersonalDataProcessed extends StatelessWidget {
  const PrivacyCategoriesPersonalDataProcessed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '4.1.', S.of(context).followingPersonalDataSubjects),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.1.1.', S.of(context).individualsUsers),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.1.2.', S.of(context).individualsRegisteredUsers),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.', S.of(context).followingCategories),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.1.', S.of(context).policyTelephoneNumber),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.2.', S.of(context).policyUserData1),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.3.', S.of(context).policyUserData2),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.4.', S.of(context).policyUserData3),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.5.', S.of(context).policyUserData4),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.6.', S.of(context).policyUserData5),
        ],
      ),
    );
  }
}
