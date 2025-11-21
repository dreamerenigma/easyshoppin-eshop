import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SafeModeController extends GetxController {
  var isSafeModeEnabled = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadSafeModeSetting();
  }

  void loadSafeModeSetting() {
    isSafeModeEnabled.value = box.read('isSafeModeEnabled') ?? false;
  }

  void toggleSafeMode(bool value) {
    isSafeModeEnabled.value = value;
    box.write('isSafeModeEnabled', value);
  }
}
