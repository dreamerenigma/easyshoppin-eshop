import 'package:easyshoppin_eshop/features/authentication/controllers/login/login_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/language_controller.dart';
import 'package:easyshoppin_eshop/features/personalization/controllers/themes_controller.dart';
import 'package:easyshoppin_eshop/utils/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'data/repositories/brands/brand_repository.dart';
import 'data/repositories/email/email_send_repository.dart';
import 'data/repositories/subcategories/subcategory_repository.dart';
import 'features/authentication/models/country_model.dart';
import 'features/personalization/screens/information/widgets/select_images_provider.dart';
import 'firebase_options.dart';
import 'features/personalization/controllers/user_controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  /// -- Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Initialize TLocalStorage
  await LocalStorage.init('easyshoppin_bucket');

  /// -- Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) {
      Get.put(AuthenticationRepository());
      Get.put(EmailSendRepository());
      Get.put(UserController());
      Get.put(LoginController());
      Get.put(LanguageController());
      Get.put(BrandRepository());
      Get.put(ThemesController());
    },
  );

  Get.put(SubCategoryRepository());

  /// -- Initialize application services
  await initApp();

  /// -- Run the application
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedCountryModel()),
        ChangeNotifierProvider(create: (context) => SelectedImagesProvider()),
      ],
      child: const App(),
    ),
  );
}
