import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class PrivacyPurposesPersonalData extends StatelessWidget {
  const PrivacyPurposesPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '2.1.', S.of(context).companyProcessesData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '2.1.1.', S.of(context).registrationPersonalAccount),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '2.1.2.', S.of(context).personalAccountRegisteredUser),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '2.1.3.', S.of(context).providingPossibilityBooking),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '2.1.4.', S.of(context).providingCustomsClearance),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '2.1.5.', S.of(context).providingDataCompletingTraining),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '2.1.6.', S.of(context).usingSiteCapabilities),
        ],
      ),
    );
  }
}
