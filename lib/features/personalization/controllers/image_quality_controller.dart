import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ImageQualityController extends GetxController {
  var isHDEnabled = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadHDSetting();
  }

  void loadHDSetting() {
    isHDEnabled.value = box.read('isHDEnabled') ?? false;
  }

  void toggleHD(bool value) {
    isHDEnabled.value = value;
    box.write('isHDEnabled', value);
  }
}
