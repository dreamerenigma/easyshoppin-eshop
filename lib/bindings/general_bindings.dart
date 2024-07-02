import 'package:easyshoppin_eshop/features/personalization/controllers/address_controller.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/product/checkout_controller.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/product/variation_controller.dart';
import 'package:easyshoppin_eshop/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

import '../features/personalization/controllers/load_data_controller.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
    Get.put(LoadDataController());
  }
}
