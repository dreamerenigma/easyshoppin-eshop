import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/colors.dart';

class LanguageController extends GetxController {
  static LanguageController get instance => Get.find();

  var selectedLanguage = 'ru'.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    String? savedLanguage = box.read('selectedLanguage');
    if (savedLanguage != null) {
      selectedLanguage.value = savedLanguage;
      Get.updateLocale(Locale(savedLanguage));
    } else {
      selectedLanguage.value = 'ru';
    }
  }

  void setLanguage(String language) {
    selectedLanguage.value = language;
    box.write('selectedLanguage', language);
    Get.updateLocale(Locale(language));
  }

  Future<void> selectLanguage(BuildContext context) async {
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
                    S.of(context).selectLanguage,
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
                        const SizedBox(width: 16), // Space between icon and text
                        Text(S.of(context).russianLanguage),
                      ],
                    ),
                    value: 'ru',
                    groupValue: selectedLanguage.value,
                    onChanged: (value) {
                      if (value != null) {
                        setLanguage(value);
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
                          TImages.usaFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16), // Space between icon and text
                        Text(S.of(context).englishLanguage),
                      ],
                    ),
                    value: 'en',
                    groupValue: selectedLanguage.value,
                    onChanged: (value) {
                      if (value != null) {
                        setLanguage(value);
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
                          TImages.spainFlag,
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 16), // Space between icon and text
                        Text(S.of(context).spanishLanguage),
                      ],
                    ),
                    value: 'es',
                    groupValue: selectedLanguage.value,
                    onChanged: (value) {
                      if (value != null) {
                        setLanguage(value);
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
