import 'dart:io';
import 'package:easyshoppin_eshop/bindings/general_bindings.dart';
import 'package:easyshoppin_eshop/routes/app_routes.dart';
import 'package:easyshoppin_eshop/routes/routes.dart';
import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:easyshoppin_eshop/utils/device/device_utility.dart';
import 'package:easyshoppin_eshop/utils/theme/theme.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'config.dart';
import 'features/personalization/controllers/language_controller.dart';
import 'features/personalization/controllers/themes_controller.dart';
import 'features/shop/screens/home/widgets/windows_app_shell.dart';
import 'features/splash_screen/screens/main_window_screen.dart';
import 'features/utils/windows/window_util_desktop.dart';
import 'generated/l10n/l10n.dart';

Future<void> initApp() async {
  /// -- Widget Binding
  WidgetsFlutterBinding.ensureInitialized();

  /// -- System Ui mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  /// -- Set setting orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /// -- Activate Firebase App Check
  if (!kIsWeb && defaultTargetPlatform != TargetPlatform.windows) {
    await FirebaseAppCheck.instance.activate(
      providerWeb: ReCaptchaV3Provider(Config.recaptchaV3Key),
    );
  }

  /// -- Set system UI status bar color globally
  DeviceUtils.setStatusBarColor(TColors.transparent);

  /// -- Size window app
  setupWindow();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.put(LanguageController());
    final ThemesController themesController = Get.put(ThemesController());
    final currentRouteNotifier = ValueNotifier<String?>(null);

    return Obx(() => GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: themesController.getThemeMode(),
      theme: TAppTheme.getLightTheme(),
      darkTheme: TAppTheme.getDarkTheme(),
      getPages: AppRoutes.pages,
      locale: Locale(languageController.selectedLanguage.value),
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
        Locale('es'),
      ],
      initialRoute: TRoutes.splash,
      home: defaultTargetPlatform == TargetPlatform.windows
        ? WindowsAppShell(child: const Center(child: CircularProgressIndicator(color: TColors.white)))
        : const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: TColors.white)),
      ),
      builder: (context, child) {
        if (kIsWeb) {
          return child ?? Container();
        }
        else if (Platform.isWindows) {
          return MainWindow(
            currentRouteNotifier: currentRouteNotifier,
            child: child ?? Container(),
          );
        } else {
          return child ?? Container();
        }
      },
    ));
  }
}
