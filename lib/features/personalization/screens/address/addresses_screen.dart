import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/buttons/hover_icon_button.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/dialogs/addresses_bottom_dialog.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/inputs/search_text_field.dart';
import 'package:easyshoppin_eshop/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../utils/constants/app_colors.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  int activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode ? TColors.youngNight : TColors.white,
      body: Column(
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: context.isDarkMode ? TColors.dark : TColors.grey.withAlpha((0.7 * 255).toInt()),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(color: TColors.white.withAlpha((0.1 * 255).toInt()), borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: _buildTabButton('Пункт выдачи', 0)),
                          const SizedBox(width: 8),
                          Expanded(child: _buildTabButton('Курьером', 1)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                HoverIconButton(
                  icon: Ionicons.close_outline,
                  normalColor: context.isDarkMode ? TColors.darkGrey : TColors.darkGrey,
                  hoverColor: context.isDarkMode ? TColors.white : TColors.black,
                  size: 28,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          SearchTextField(),
          Expanded(
            child: Center(
              child: Text(
                activeTabIndex == 0 ? 'Выбрана вкладка: Пункт выдачи' : 'Выбрана вкладка: Курьером',
                style: const TextStyle(color: TColors.white, fontSize: TSizes.fontSizeBg),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
            child: SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                onPressed: () {
                  showAddressesBottomDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.isDarkMode ? TColors.softNight : TColors.white,
                  splashFactory: NoSplash.splashFactory,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  side: BorderSide.none,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Ionicons.list, color: TColors.white, size: 20),
                    const SizedBox(width: 8),
                    Text('Списком', style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w500, height: 1)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    final bool isActive = activeTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => activeTabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? TColors.steelGrey.withAlpha((0.5 * 255).toInt()) : TColors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(title, style: TextStyle(color: TColors.white, fontWeight: FontWeight.w400), textAlign: TextAlign.center),
      ),
    );
  }
}
