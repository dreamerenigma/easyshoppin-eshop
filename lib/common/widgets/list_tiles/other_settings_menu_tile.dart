import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/currency_controller.dart';
import 'package:easyshoppin_eshop/utils/constants/colors.dart';

class TOtherSettingsMenuTileMenuTile extends StatelessWidget {
  const TOtherSettingsMenuTileMenuTile({
    super.key,
    required this.currencyController,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
  final CurrencyController currencyController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Obx(() => buildSubtitle(
          currencyController.getSelectedCurrencyText(context),
          Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey))),
      onTap: () => currencyController.selectCurrency(context),
    );
  }

  Widget buildSubtitle(String text, TextStyle? style) {
    return Text(
      text,
      style: style,
    );
  }
}
