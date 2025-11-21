import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingRegistration extends StatelessWidget {
  const TRulesTradingRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '3.1.', S.of(context).onlyRegisteredBuyers),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.2.', S.of(context).registeringMarketplace),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.3.', S.of(context).accessPersonalAccount),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.4.', S.of(context).accessCodeBuyer),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.5.', S.of(context).changingPhoneNumber),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.6.', S.of(context).lossTelephoneNumber),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.7.', S.of(context).registeringAccountMarketplace),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.7.1.', S.of(context).registrationDataVoluntarily),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.7.2.', S.of(context).registrationDataElectronically),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.7.3.', S.of(context).registrationDataPolicy),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.7.4.', S.of(context).registrationDatInternet),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.7.5.', S.of(context).registrationDataProtection),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.7.6.', S.of(context).registrationDataEmail),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.8.', S.of(context).buyerInformed),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.9.', S.of(context).bankCard),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.10.', S.of(context).copyingApp),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3.11.', S.of(context).correctnessInformation),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
