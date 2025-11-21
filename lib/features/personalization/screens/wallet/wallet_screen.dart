import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/wallet/settings_help_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../utils/widgets/no_glow_scroll_behavior.dart';
import '../../controllers/payment_methods_controller.dart';
import 'add_password_log_wallet_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final paymentController = Get.put(PaymentMethodsController());
  bool _passwordScreenShown = false;

  Future<void> _reloadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  void _handleFirstTap(VoidCallback? action) {
    if (!_passwordScreenShown) {
      _passwordScreenShown = true;
      Get.to(() => AddPasswordLogWalletScreen());
    } else {
      action?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: _reloadData,
          displacement: 30,
          color: TColors.primary,
          backgroundColor: TColors.buttonDarkGrey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              /// -- Header
              TPrimaryHeaderContainer(
                backgroundColor: TColors.green,
                child: Column(
                  children: [
                    /// AppBar
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 8),
                      child: TAppBar(
                        titleSpacing: 0,
                        title: Row(
                          children: [
                            Text('ES Кошелёк', style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeLg)),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: TColors.check,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text("Стандартный", style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.w500)),
                            ),
                            const Spacer(),
                            Material(
                              color: TColors.transparent,
                              child: InkWell(
                                onTap: () => Get.to(() => const SettingsHelpScreen()),
                                splashColor: TColors.darkerGrey.withAlpha((0.2 * 255).toInt()),
                                highlightColor: TColors.darkerGrey.withAlpha((0.2 * 255).toInt()),
                                borderRadius: BorderRadius.circular(50),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: const Icon(Icons.more_horiz_rounded, color: TColors.white, size: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                        showBackArrow: false,
                        backArrowColor: TColors.white,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwLittle),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => _handleFirstTap(() {}),
                                child: Row(
                                  children: [
                                    Text("12 450 ₽", style: TextStyle(fontSize: TSizes.fontSizeUn, fontWeight: FontWeight.w500)),
                                    const SizedBox(width: 6),
                                    Icon(Icons.keyboard_arrow_down_outlined, size: 30),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () => _handleFirstTap(() {}),
                                child: Icon(FeatherIcons.eyeOff, size: 28),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Пополните, чтобы оплачивать покупки", style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.grey)),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItemsSmall),
                          Row(
                            children: [
                              Expanded(
                                child: Material(
                                  color: TColors.youngNight,
                                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                                  child: InkWell(
                                    onTap: () {
                                      paymentController.selectPaymentMethods(context);
                                    },
                                    splashColor: TColors.black.withAlpha((0.2 * 255).toInt()),
                                    highlightColor: TColors.black.withAlpha((0.2 * 255).toInt()),
                                    borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        color: TColors.youngNight,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: TColors.black),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          children: [
                                            Icon(Icons.add_circle_outline, size: 26, color: TColors.primary),
                                            const SizedBox(height: 8),
                                            Text("Пополнить", style: TextStyle(fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Material(
                                  color: TColors.youngNight,
                                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                                  child: InkWell(
                                    onTap: () => _handleFirstTap(() {
                                      paymentController.selectPaymentMethods(context);
                                    }),
                                    splashColor: TColors.black.withAlpha((0.2 * 255).toInt()),
                                    highlightColor: TColors.black.withAlpha((0.2 * 255).toInt()),
                                    borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                                    child: Ink(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: TColors.youngNight,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(BootstrapIcons.arrow_up, size: 26, color: TColors.primary),
                                          const SizedBox(height: 8),
                                          Text("Перевести", style: TextStyle(fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwSectionsExpanded),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
