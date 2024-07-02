import 'package:easyshoppin_eshop/data/repositories/banners/banner_repository.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController {
  /// Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final controller = Get.put(BannerRepository());
  final logger = Logger();

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigational Dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading banners
      isLoading.value = true;

      // Fetch Banners from Repository
      final fetchedBanners = await BannerRepository.instance.fetchBanners();
      logger.d('Fetched banners from Firebase:');
      for (var banner in fetchedBanners) {
        logger.d('Banner: ${banner.imageUrl}, targetScreen: ${banner.targetScreen}, active: ${banner.active}');
      }

      // Assign Banners
      banners.assignAll(fetchedBanners);
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      });
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
