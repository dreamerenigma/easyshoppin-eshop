import 'dart:developer';
import 'package:easyshoppin_eshop/data/repositories/sales/sale_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/dummy_data.dart';
import '../../../data/repositories/banners/banner_repository.dart';
import '../../../data/repositories/brands/brand_repository.dart';
import '../../../data/repositories/categories/category_repository.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../../../data/repositories/subcategories/subcategory_repository.dart';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';

class LoadDataController extends GetxController {
  static LoadDataController get instance => Get.find();

  /// Method to upload categories and their subcategories
  static Future<void> uploadCategoriesAndSubCategories(BuildContext context) async {
    bool categoriesUploaded = false;
    bool subCategoriesUploaded = false;

    try {
      // Получаем категории
      final categories = TDummyData.categories(context);

      // Логируем категории
      log("Uploading categories to Firestore...");
      for (var category in categories) {
        log("Category: ${category.name} (${category.id})");
      }

      // Загружаем категории в Firestore
      await CategoryRepository.instance.uploadDummyData(categories);
      categoriesUploaded = true;
      Get.snackbar(S.of(context).success, S.of(context).categoriesUploadedSuccess);

      // Загружаем подкатегории для каждой категории
      for (var category in categories) {
        final subCategories = TDummyData.subCategories(context)
            .where((subCategory) => subCategory.parentId == category.id)
            .toList();

        // Логируем подкатегории
        log("Uploading subcategories for category: ${category.name} (${category.id})");
        log("Subcategories: ${subCategories.map((e) => e.name).toList()}");

        // Загружаем подкатегории в Firestore
        await SubCategoryRepository.instance.uploadDummyData(subCategories);
      }

      subCategoriesUploaded = true;

      // Уведомление об успешной загрузке категорий и подкатегорий
      if (categoriesUploaded && subCategoriesUploaded) {
        Get.snackbar(S.of(context).success, S.of(context).categoriesAndSubCategoriesUploadedSuccess);
      }

    } catch (e) {
      // Логируем ошибку
      log("Error uploading categories and subcategories: $e");

      if (!categoriesUploaded) {
        Get.snackbar(S.of(context).error, S.of(context).failedUploadCategories);
      }
      if (!subCategoriesUploaded && categoriesUploaded) {
        Get.snackbar(S.of(context).error, S.of(context).failedUploadSubCategories);
      }
    }
  }

  /// Method to upload brands
  static Future<void> uploadBrands(BuildContext context) async {
    try {
      final brands = TDummyData.brands;
      await BrandRepository.instance.uploadDummyData(brands);
      Get.snackbar(S.of(context).success, S.of(context).brandsUploadedSuccess);
    } catch (e) {
      Get.snackbar(S.of(context).error, '${S.of(context).failedUploadBrands}: $e');
    }
  }

  /// Method to upload products
  static Future<void> uploadProducts(BuildContext context) async {
    try {
      final products = TDummyData.products;
      await ProductRepository.instance.uploadDummyData(products);
      Get.snackbar(S.of(context).success, S.of(context).productsUploadedSuccess);
    } catch (e) {
      Get.snackbar(S.of(context).error, '${S.of(context).failedUploadProducts}: $e');
    }
  }

  /// Method to upload banners
  static Future<void> uploadBanners(BuildContext context) async {
    try {
      final banners = TDummyData.banners;
      await BannerRepository.instance.uploadDummyData(banners);
      Get.snackbar(S.of(context).success, S.of(context).bannersUploadedSuccess);
    } catch (e) {
      Get.snackbar(S.of(context).error, '${S.of(context).failedUploadBanners}: $e');
    }
  }

  /// Method to upload sales (Firestore and Firebase Storage)
  static Future<void> uploadSales(BuildContext context) async {
    try {
      final sales = TDummyData.sales(context);

      for (var sale in sales) {
        final storageService = Get.put(TFirebaseStorageService());

        final file = await storageService.getImageDataFromAssets(sale.imageUrl);
        final imageUrl = await storageService.uploadImageData('Sales', file, sale.name);

        sale.imageUrl = imageUrl;
      }

      await SaleRepository.instance.uploadSalesDummyData(sales);

      Get.snackbar(S.of(context).success, S.of(context).salesUploadedSuccessfully);
    } catch (e) {
      Get.snackbar(S.of(context).error, '${S.of(context).failedUploadSales}: $e');
    }
  }
}
