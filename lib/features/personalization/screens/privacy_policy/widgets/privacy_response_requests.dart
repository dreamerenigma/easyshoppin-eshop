import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class PrivacyResponseRequests extends StatelessWidget {
  const PrivacyResponseRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '7.1.', S.of(context).collectingPersonalDataCompany),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.2.', S.of(context).demandCompanyClarification),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.3.', S.of(context).stopTransfer),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.4.', S.of(context).appealInactionCompany),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.5.', S.of(context).protectLegitimateInterests),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.6.', S.of(context).unlawfulProcessing),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.7.', S.of(context).inaccuratePersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.8.', S.of(context).factInaccuracyPersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.9.', S.of(context).purposeProcessingPersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.10.', S.of(context).withdrawsConsent),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.11.', S.of(context).subjectPersonalDataApplies),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.12.', S.of(context).possibleDestroyPersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.13.', S.of(context).personalDataProcessed),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.13.1.', S.of(context).nameAddressCompany),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.13.2.', S.of(context).purposeProcessingPersonal),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.13.3.', S.of(context).listPersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.13.4.', S.of(context).intendedUsersPersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.13.5.', S.of(context).rightsSubjectPersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.13.6.', S.of(context).sourcePersonalData),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.14.', S.of(context).companyReleased),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.14.1.', S.of(context).personalDataNotified),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.14.2.', S.of(context).personalDataAuthorized),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.14.3.', S.of(context).personalDataStatistical),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.14.4.', S.of(context).relevantParagraphs),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.15.', S.of(context).companyEnsuresRecording),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.16.', S.of(context).investigatesViolations),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.17.', S.of(context).informationRegardingProcessing),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.18.', S.of(context).electronicDocument),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '7.19.', S.of(context).interactionOtherIssues),
        ],
      ),
    );
  }
}
