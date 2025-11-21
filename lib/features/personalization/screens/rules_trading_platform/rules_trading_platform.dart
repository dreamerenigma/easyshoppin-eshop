import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_seller_info.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_appeals_complaints.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_generation_provisions.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_payment_order.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_platform_placing_order.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_registration.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_terms.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_order_cancel.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_order_delivery.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_rights_guarantees.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/rules_trading_platform/widgets/rules_trading_user_data.dart';
import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_sizes.dart';
import 'widgets/animated_expansion_tile.dart';

class TRulesTradingPlatformScreen extends StatefulWidget {
  const TRulesTradingPlatformScreen({super.key});

  @override
  TRulesTradingPlatformScreenState createState() => TRulesTradingPlatformScreenState();
}

class TRulesTradingPlatformScreenState extends State<TRulesTradingPlatformScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).rulesUsingTradingPlatform,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              AnimatedExpansionTile(
                title: S.of(context).terms,
                children: const [TRulesTradingTerms()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).generationProvisions,
                children: const [TGenerationProvision()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).registrationSite,
                children: const [TRulesTradingRegistration()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).placingOrder,
                children: const [TRulesTradingPlacingOrder()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).paymentOrder,
                children: const [TRulesTradingPaymentOrder()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).userData,
                children: const [TRulesTradingUserData()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).sellerInformation,
                children: const [TRulesTradingSellerInfo()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).orderDelivery,
                children: const [TRulesTradingOrderDelivery()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).cancelReturnOrdersConsumers,
                children: const [TRulesTradingOrderCancel()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).reviewsRatingsProductConsumers,
                children: const [TRulesTradingRightsGuarantees()],
              ),
              const Divider(height: 0, thickness: 1),
              AnimatedExpansionTile(
                title: S.of(context).appealsComplaints,
                children: const [TRulesTradingAppealsComplaints()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
