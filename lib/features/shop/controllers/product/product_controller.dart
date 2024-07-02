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
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      logger.d('Загрузка избранных товаров из Firebase.');

      final products = await productRepository.getFeaturedProducts();

      logger.d('Загружено избранных товаров: ${products.length} шт.');
      for (var product in products) {
        logger.d('Товар: ${product.title}, Цена: ${product.price}, Цена со скидкой: ${product.salePrice}');
      }

      featuredProducts.assignAll(products);
    } on FirebaseException catch (e) {
      logger.e('Ошибка Firebase при загрузке избранных товаров: $e');
      TLoaders.errorSnackBar(title: 'Ошибка Firebase!', message: e.toString());
    } on PlatformException catch (e) {
      logger.e('Ошибка платформы при загрузке избранных товаров: $e');
      TLoaders.errorSnackBar(title: 'Ошибка платформы!', message: e.toString());
    } catch (e) {
      logger.e('Неизвестная ошибка при загрузке избранных товаров: $e');
      TLoaders.errorSnackBar(title: 'Ошибка!', message: 'Что-то пошло не так. Пожалуйста, попробуйте снова.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchProductsWithStockStatus() async {
    try {
      logger.d('Fetching products with stock status from Firebase.');

      final products = await productRepository.getProductsWithStockStatus();

      logger.d('Fetched products with stock status: ${products.length} items');
      for (var product in products) {
        logger.d('Product: ${product.title}, Stock: ${product.stock}');
      }

      return products;
    } catch (e) {
      logger.e('Error fetching products with stock status: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      logger.d('Fetching all featured products from Firebase.');

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      logger.d('Fetched all featured products: ${products.length} items');
      for (var product in products) {
        logger.d('Product: ${product.title}, Price: ${product.price}, Sale Price: ${product.salePrice}');
      }

      return products;
    } catch (e) {
      logger.e('Error fetching all featured products: $e');
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
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
