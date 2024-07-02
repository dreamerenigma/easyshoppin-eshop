import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class TRulesTradingPaymentOrder extends StatelessWidget {
  const TRulesTradingPaymentOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '5.1.', S.of(context).returnGoodsCarriedAccordance),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.2.', S.of(context).priceGoodsIndicated),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.3.', S.of(context).pricesProductsDetermined),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.3.1.', S.of(context).finalPriceProduct),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.3.2.', S.of(context).promotionalDiscountPayment),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.3.3.', S.of(context).discountPromoCode),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.4.', S.of(context).esDiscountPayment),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.5.', S.of(context).onlyPlacingOrders),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.6.', S.of(context).paymentOrderManner),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.7.', S.of(context).accessAdvancePayment),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.', S.of(context).buyersPreviouslyPurchased),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.1', S.of(context).tradingPlatformPayments),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.2', S.of(context).paymentUsingBankCard),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.3', S.of(context).personalAccountBalance),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.4', S.of(context).paymentInstallments),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.5', S.of(context).fastPaymentSystem),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.6', S.of(context).creditPaymentInstallments),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.8.7', S.of(context).paymentElectronicWallet),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.9.', S.of(context).otherPaymentMethods),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.9.1.', S.of(context).paymentUponReceipt),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.9.2.', S.of(context).paymentMethodUpon),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.9.3.', S.of(context).absenceDebitingFunds),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.9.4.', S.of(context).buyerUnderstandsAbove),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.10.', S.of(context).endingOrderAgreeing),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.10.1.', S.of(context).paymentPersonalAccountBalance),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.10.2.', S.of(context).orderPersonalAccountBalance),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.11.', S.of(context).insufficientFundsReflected),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.11.1.', S.of(context).paymentByInstallments),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.11.2.', S.of(context).paymentMethodInstallments),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.11.3.', S.of(context).choosingInstallmentPayment),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.12.', S.of(context).buyerAssumesObligations),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.12.1.', S.of(context).paymentUsingCreditFunds),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '', S.of(context).paymentInInstallments),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.12.2.', S.of(context).paymentInstallmentsPartners),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '', S.of(context).buyerChoosesPayment),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '', S.of(context).buyerAssumesObligationsRisks),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.13.', S.of(context).buyerAssumesObligationsRisks),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.14.', S.of(context).orderUsingElectronicWallet),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.14.1.', S.of(context).orderingServices),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '1', S.of(context).reasonFundsGoods1),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '2', S.of(context).reasonFundsGoods2),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '3', S.of(context).reasonFundsGoods3),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '4', S.of(context).reasonFundsGoods4),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.14.2.', S.of(context).paragraphRevoked),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.15.', S.of(context).uponReceiptOrder),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.16.', S.of(context).purchaseSaleAgreement),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.17.', S.of(context).accordanceTermsRules),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.18.', S.of(context).buyerInitiateTransfer),
          const SizedBox(height: 8.0),
          buildRichTextSimple(context, '5.19.', S.of(context).buyerAcknowledges),
        ],
      ),
    );
  }
}