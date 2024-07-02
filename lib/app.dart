import 'package:easyshoppin_eshop/bindings/general_bindings.dart';
import 'package:easyshoppin_eshop/routes/app_routes.dart';
import 'package:easyshoppin_eshop/utils/constants/colors.dart';
import 'package:easyshoppin_eshop/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'features/personalization/controllers/language_controller.dart';
import 'features/personalization/controllers/themes_controller.dart';
import 'generated/l10n/l10n.dart';

/// Use this Class to setup themes, initial Bindings, any animations and more
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.put(LanguageController());
    final ThemesController themesController = Get.put(ThemesController());

    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themesController.getThemeMode(),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      locale: Locale(languageController.selectedLanguage.value),
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      /// Show Loader or Circular Progress Indicator while Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    ));
  }
}
