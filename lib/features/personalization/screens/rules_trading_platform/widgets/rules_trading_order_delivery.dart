import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingOrderDelivery extends StatelessWidget {
  const TRulesTradingOrderDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '8.1.', S.of(context).transferOwnership),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.2.', S.of(context).deliveryTimeProduct),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.3.', S.of(context).cancelOrderConsumer),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.4.', S.of(context).refusalCarryDelivery),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.5.', S.of(context).placeDeliveryGoods),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.5.1.', S.of(context).deliveryGoodsPickPoint),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.5.2.', S.of(context).deliveryGoodsParcelTerminal),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.5.3', S.of(context).deliveryToDoorOrderedGoods),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '6.5.4.', S.of(context).clickDelivery),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.6.', S.of(context).receivingOrder),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.7.', S.of(context).deliveryLargeSizedGoods),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.8.', S.of(context).deliveryElectronicDevices),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.', S.of(context).deliveryOrderedVehicles),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.1.', S.of(context).purchasingVehicle),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.2.', S.of(context).consumerUnderstandsAgrees),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.3.', S.of(context).purchaseOrderVehicle),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.4.', S.of(context).afterPlacingOrder),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.5.', S.of(context).saleVehiclesWarehouse),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.6.', S.of(context).consumerRightInspect),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.7', S.of(context).conclusionPurchaseSaleAgreement),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.8', S.of(context).purchaseSaleAgreementVehicle),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.9.', S.of(context).concludedSellerConsumer),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.10.', S.of(context).sellerCarriesDelivery),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.11.', S.of(context).packageDocumentsVehicle),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.9.12.', S.of(context).qualityClaims),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '8.10.', S.of(context).pickupSellerStore),
        ],
      ),
    );
  }
}
