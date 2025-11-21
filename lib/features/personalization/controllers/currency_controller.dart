import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easyshoppin_eshop/utils/constants/app_images.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../utils/widgets/no_glow_scroll_behavior.dart';

class CurrencyController extends GetxController {
  static CurrencyController get instance => Get.find();

  var selectedCurrency = 'russianRuble'.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    String? savedCurrency = box.read('selectedCurrency');
    if (savedCurrency != null) {
      selectedCurrency.value = savedCurrency;
    } else {
      selectedCurrency.value = 'russianRuble';
    }
    selectedCurrency.listen((newValue) {
      update();
    });
  }

  void setCurrency(String currency) {
    selectedCurrency.value = currency;
    box.write('selectedCurrency', currency);
  }

  String getSelectedCurrencyText(BuildContext context) {
    switch (selectedCurrency.value) {
      case 'ru':
        return S.of(context).russianRuble;
      case 'by':
        return S.of(context).belarusianRuble;
      case 'am':
        return S.of(context).armenianDram;
      case 'kz':
        return S.of(context).kazakhTenge;
      case 'kg':
        return S.of(context).kyrgyzSom;
      case 'uz':
        return S.of(context).uzbekSum;
      default:
        return S.of(context).russianRuble;
    }
  }

  Future<void> selectCurrency(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (_) => ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10, bottom: 10),
                    child: Text(S.of(context).currencyPrices, style: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  _buildCurrencyOption(
                    flagImage: TImages.russiaFlag,
                    currencyName: S.of(context).russianRuble,
                    value: 'ru',
                  ),
                  _buildCurrencyOption(
                    flagImage: TImages.belarusFlag,
                    currencyName: S.of(context).belarusianRuble,
                    value: 'by',
                  ),
                  _buildCurrencyOption(
                    flagImage: TImages.armeniaFlag,
                    currencyName: S.of(context).armenianDram,
                    value: 'am',
                  ),
                  _buildCurrencyOption(
                    flagImage: TImages.kazakhstanFlag,
                    currencyName: S.of(context).kazakhTenge,
                    value: 'kz',
                  ),
                  _buildCurrencyOption(
                    flagImage: TImages.kyrgyzstanFlag,
                    currencyName: S.of(context).kyrgyzSom,
                    value: 'kg',
                  ),
                  _buildCurrencyOption(
                    flagImage: TImages.uzbekistanFlag,
                    currencyName: S.of(context).uzbekSum,
                    value: 'uz',
                  ),
                  const SizedBox(height: TSizes.md),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyOption({
    required String flagImage,
    required String currencyName,
    required String value,
  }) {
    final RxBool isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Obx(() => InkWell(
        onTap: () {
          setCurrency(value);
          Get.back();
        },
        splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
        highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
        child: RadioListTile<String>(
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 6),
            child: Row(
              children: [
                Image.asset(flagImage, width: 25, height: 25),
                const SizedBox(width: 16),
                Text(currencyName),
              ],
            ),
          ),
          value: value,
          groupValue: selectedCurrency.value,
          onChanged: (newValue) {
            if (newValue != null) {
              setCurrency(newValue);
              Get.back();
            }
          },
          controlAffinity: ListTileControlAffinity.trailing,
          contentPadding: EdgeInsets.zero,
          activeColor: TColors.primary,
        ),
      )),
    );
  }
}
