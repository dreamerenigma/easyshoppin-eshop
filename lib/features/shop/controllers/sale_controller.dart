import 'package:easyshoppin_eshop/data/repositories/sales/sale_repository.dart';
import 'package:easyshoppin_eshop/features/shop/models/sale_model.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SaleController extends GetxController {
  static SaleController get instance => Get.find();
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<SaleModel> sales = <SaleModel>[].obs;
  final RxList<SaleModel> featuredSales = <SaleModel>[].obs;
  final controller = Get.put(SaleRepository());
  final logger = Logger();

  @override
  void onInit() {
    fetchSales();
    super.onInit();
  }

  /// Fetch Sales
  Future<void> fetchSales() async {
    try {
      isLoading.value = true;

      final fetchedSales = await SaleRepository.instance.fetchSales();
      logger.d('Fetched sales from Firebase:');
      for (var sale in fetchedSales) {
        logger.d('Sale: ${sale.imageUrl}, targetScreen: ${sale.targetScreen}, active: ${sale.active}');
      }

      sales.assignAll(fetchedSales);

      featuredSales.assignAll(fetchedSales.where((sale) => sale.active).toList());
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      });
    } finally {
      isLoading.value = false;
    }
  }
}
