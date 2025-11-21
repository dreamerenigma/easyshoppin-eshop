import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../controllers/payment_methods_controller.dart';
import '../wallet_screen.dart';

class WalletCard extends StatelessWidget {
  final PaymentMethodsController paymentController;

  const WalletCard({super.key, required this.paymentController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () => Get.to(() => WalletScreen()),
        splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
        highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 8, top: 12, bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.account_balance_wallet_outlined, color: TColors.primary, size: 30),
                        const SizedBox(width: 14),
                        Text("12 450 ₽", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 42),
                      child: Row(
                        children: [
                          Text("ES Кошелёк", style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey)),
                          const SizedBox(width: 4),
                          const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(Icons.arrow_forward_ios_rounded, color: TColors.darkGrey, size: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  paymentController.selectPaymentMethods(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide.none,
                  ),
                  backgroundColor: TColors.primary,
                ),
                child: const Text("Пополнить", style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
