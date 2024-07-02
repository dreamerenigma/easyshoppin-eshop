import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingPlacingOrder extends StatelessWidget {
  const TRulesTradingPlacingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '4.1.', S.of(context).purchaseTermsRules),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.1.1.', S.of(context).concludingAgreements),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.2.', S.of(context).placingOrderPersonalAccount),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.3.', S.of(context).orderingGoods),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.4.', S.of(context).orderingProduct),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.5.', S.of(context).clickingButtonPlacePay),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.6.', S.of(context).informationProductCard),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.7.', S.of(context).placingOrderBuyer),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.8.', S.of(context).placingOrderMarketplace),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.8.1.', S.of(context).emailsPushNotifications),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.8.2.', S.of(context).messagesSMS),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.8.3.', S.of(context).callTelephoneNumber),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '', S.of(context).buyerPersonalAccount),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.9.', S.of(context).orderCountryEAEU),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.9.1.', S.of(context).importEAEU),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.9.2.', S.of(context).obligationDuties),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.9.3.', S.of(context).customsClearanceGoods),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.9.4.', S.of(context).availableCustomsRepresentatives),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.9.5.', S.of(context).returnGoodsCarried),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.10.', S.of(context).orderGoodsUnitrade),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.11.', S.of(context).orderGoodsTANAIS),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.12.', S.of(context).orderGoodsJSC),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.13.', S.of(context).orderGoodsGBSBroker),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4.14.', S.of(context).orderGoodsLOGISTIC),
        ],
      ),
    );
  }
}
