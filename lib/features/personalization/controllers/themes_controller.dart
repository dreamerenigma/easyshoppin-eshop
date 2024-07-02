import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/colors.dart';

class ThemesController extends GetxController {
  static ThemesController get instance => Get.find();

  var selectedThemes = 'light'.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    selectedThemes.value = box.read('selectedThemes') ?? 'light';
    applyTheme(selectedThemes.value);
  }

  ThemeMode getThemeMode() {
    switch (selectedThemes.value) {
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  void setThemes(String theme) {
    selectedThemes.value = theme;
    box.write('selectedThemes', theme);
    applyTheme(theme);  // Ensure the theme is applied
  }

  void applyTheme(String theme) {
    if (theme == 'light') {
      Get.changeThemeMode(ThemeMode.light);
    } else if (theme == 'dark') {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
  }

  Future<void> selectThemes(BuildContext context) async {
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
                    S.of(context).selectTheme,
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
                        const Icon(WeatherIcons.day_sunny),
                        const SizedBox(width: 16),
                        Text(S.of(context).lightTheme),
                      ],
                    ),
                    value: 'light',
                    groupValue: selectedThemes.value,
                    onChanged: (value) {
                      if (value != null) {
                        setThemes(value);
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
                        const Icon(BootstrapIcons.moon),
                        const SizedBox(width: 16),
                        Text(S.of(context).darkTheme),
                      ],
                    ),
                    value: 'dark',
                    groupValue: selectedThemes.value,
                    onChanged: (value) {
                      if (value != null) {
                        setThemes(value);
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
                        const Icon(Ionicons.settings_outline),
                        const SizedBox(width: 16),
                        Text(S.of(context).systemTheme),
                      ],
                    ),
                    value: 'system',
                    groupValue: selectedThemes.value,
                    onChanged: (value) {
                      if (value != null) {
                        setThemes(value);
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

