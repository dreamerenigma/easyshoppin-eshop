import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/dummy_data.dart';
import '../../../data/repositories/banners/banner_repository.dart';
import '../../../data/repositories/brands/brand_repository.dart';
import '../../../data/repositories/categories/category_repository.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class LoadDataController extends GetxController {
  static LoadDataController get instance => Get.find();

  /// Load Data Categories Dialog
  void loadDataCategoriesPopup(BuildContext context) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: S.of(context).loadCategoryData,
      middleText: S.of(context).uploadCategoryDatabase,
      confirm: ElevatedButton(
        onPressed: () async {
          await uploadCategories();
          Navigator.of(Get.overlayContext!).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primary,
          side: const BorderSide(color: TColors.primary)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text(S.of(context).upload)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text(S.of(context).cancel),
      ),
    );
  }

  /// Load Data Brands Dialog
  void loadDataBrandsPopup(BuildContext context) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: S.of(context).loadBrandData,
      middleText: S.of(context).uploadBrandDatabase,
      confirm: ElevatedButton(
        onPressed: () async {
          await uploadBrands();
          Navigator.of(Get.overlayContext!).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primary,
          side: const BorderSide(color: TColors.primary)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text(S.of(context).upload)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text(S.of(context).cancel),
      ),
    );
  }

  /// Load Data Products Dialog
  void loadDataProductsPopup(BuildContext context) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: S.of(context).loadProductData,
      middleText: S.of(context).uploadProductDatabase,
      confirm: ElevatedButton(
        onPressed: () async {
          await uploadBrands();
          Navigator.of(Get.overlayContext!).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primary,
          side: const BorderSide(color: TColors.primary)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text(S.of(context).upload)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text(S.of(context).cancel),
      ),
    );
  }

  /// Load Data Banners Dialog
  void loadDataBannersPopup(BuildContext context) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: S.of(context).loadBannerData,
      middleText: S.of(context).uploadBannerDatabase,
      confirm: ElevatedButton(
        onPressed: () async {
          await uploadBrands();
          Navigator.of(Get.overlayContext!).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.primary,
          side: const BorderSide(color: TColors.primary)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text(S.of(context).upload)),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text(S.of(context).cancel),
      ),
    );
  }

  /// Method to upload categories
  Future<void> uploadCategories() async {
    try {
      final categories = TDummyData.categories;
      await CategoryRepository.instance.uploadDummyData(categories);
      Get.snackbar('Success', 'Categories uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload categories: $e');
    }
  }

  /// Method to upload brands
  Future<void> uploadBrands() async {
    try {
      final brands = TDummyData.brands;
      await BrandRepository.instance.uploadDummyData(brands);
      Get.snackbar('Success', 'Brands uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload brands: $e');
    }
  }

  /// Method to upload products
  Future<void> uploadProducts() async {
    try {
      final products = TDummyData.products;
      await ProductRepository.instance.uploadDummyData(products);
      Get.snackbar('Success', 'Products uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload products: $e');
    }
  }

  /// Method to upload banners
  Future<void> uploadBanners() async {
    try {
      final banners = TDummyData.banners;
      await BannerRepository.instance.uploadDummyData(banners);
      Get.snackbar('Success', 'Banners uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload banners: $e');
    }
  }
}
