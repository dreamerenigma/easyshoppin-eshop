import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/utils/constants/enums.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../data/repositories/product/product_repository.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  final logger = Logger();

  @override
  void onInit() async {
    super.onInit();
    fetchFeaturedProducts();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      log('Загрузка избранных товаров из Firebase.');

      final products = await productRepository.getFeaturedProducts();

      log('Загружено избранных товаров: ${products.length} шт.');
      for (var product in products) {
        log('Товар: ${product.title}, Цена: ${product.price}, Цена со скидкой: ${product.salePrice}');
      }

      featuredProducts.assignAll(products);
    } on FirebaseException catch (e) {
      log('Ошибка Firebase при загрузке избранных товаров: $e');
      TLoaders.errorSnackBar(title: 'Ошибка Firebase!', message: e.toString());
    } on PlatformException catch (e) {
      log('Ошибка платформы при загрузке избранных товаров: $e');
      TLoaders.errorSnackBar(title: 'Ошибка платформы!', message: e.toString());
    } catch (e) {
      log('Неизвестная ошибка при загрузке избранных товаров: $e');
      TLoaders.errorSnackBar(title: 'Ошибка!', message: 'Что-то пошло не так. Пожалуйста, попробуйте снова.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchProductsWithStockStatus() async {
    try {
      log('Fetching products with stock status from Firebase.');

      final products = await productRepository.getProductsWithStockStatus();

      log('Fetched products with stock status: ${products.length} items');
      for (var product in products) {
        log('Product: ${product.title}, Stock: ${product.stock}');
      }

      return products;
    } catch (e) {
      log('Error fetching products with stock status: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// -- Load products data
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      log('Fetching all featured products from Firebase.');

      final products = await productRepository.getFeaturedProducts();

      log('Fetched all featured products: ${products.length} items');
      for (var product in products) {
        log('Product: ${product.title}, Price: ${product.price}, Sale Price: ${product.salePrice}');
      }

      return products;
    } catch (e) {
      log('Error fetching all featured products: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }

    // Проверка, есть ли вообще вариации
    if (product.productVariations == null || product.productVariations!.isEmpty) {
      return product.price.toString();
    }

    double smallestPrice = product.productVariations!.first.price;
    double largestPrice = 0.0;

    for (var variation in product.productVariations!) {
      double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

      if (priceToConsider < smallestPrice) {
        smallestPrice = priceToConsider;
      }
      if (priceToConsider > largestPrice) {
        largestPrice = priceToConsider;
      }
    }

    // Проверка на одинаковые цены
    if ((smallestPrice - largestPrice).abs() < 0.01) {
      return largestPrice.toString();
    } else {
      return '$smallestPrice - $largestPrice';
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
