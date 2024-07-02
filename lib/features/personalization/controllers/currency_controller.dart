import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/colors.dart';

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
      builder: (_) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).currencyPrices,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const Divider(),
            Obx(() => Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 6),
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Image.asset(
                          TImages.russiaFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16),
                        Text(S.of(context).russianRuble),
                      ],
                    ),
                    value: 'ru',
                    groupValue: selectedCurrency.value,
                    onChanged: (value) {
                      if (value != null) {
                        setCurrency(value);
                        Get.back();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Image.asset(
                          TImages.belarusFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16),
                        Text(S.of(context).belarusianRuble),
                      ],
                    ),
                    value: 'by',
                    groupValue: selectedCurrency.value,
                    onChanged: (value) {
                      if (value != null) {
                        setCurrency(value);
                        Get.back();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Image.asset(
                          TImages.armeniaFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16),
                        Text(S.of(context).armenianDram),
                      ],
                    ),
                    value: 'am',
                    groupValue: selectedCurrency.value,
                    onChanged: (value) {
                      if (value != null) {
                        setCurrency(value);
                        Get.back();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Image.asset(
                          TImages.kazakhstanFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16),
                        Text(S.of(context).kazakhTenge),
                      ],
                    ),
                    value: 'kz',
                    groupValue: selectedCurrency.value,
                    onChanged: (value) {
                      if (value != null) {
                        setCurrency(value);
                        Get.back();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Image.asset(
                          TImages.kyrgyzstanFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16),
                        Text(S.of(context).kyrgyzSom),
                      ],
                    ),
                    value: 'kg',
                    groupValue: selectedCurrency.value,
                    onChanged: (value) {
                      if (value != null) {
                        setCurrency(value);
                        Get.back();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  RadioListTile<String>(
                    title: Row(
                      children: [
                        Image.asset(
                          TImages.uzbekistanFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16),
                        Text(S.of(context).uzbekSum),
                      ],
                    ),
                    value: 'uz',
                    groupValue: selectedCurrency.value,
                    onChanged: (value) {
                      if (value != null) {
                        setCurrency(value);
                        Get.back();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    activeColor: TColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
