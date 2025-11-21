import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getProductsWithStockStatus() async {
    try {
      QuerySnapshot<Object?> querySnapshot = await _db.collection('Products').where('stock', isGreaterThan: 0).get();

      List<ProductModel> products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).get();

      if (snapshot.docs.isEmpty) {
        log('No featured products found');
        return [];
      }

      final products = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      log('Found ${products.length} featured products');
      for (var product in products) {
        log('Product: ${product.title}, Price: ${product.price}, Sale Price: ${product.salePrice}');
      }

      return products;
    } catch (e) {
      log('Error fetching all featured products: $e');
      rethrow;
    }
  }

  bool convertStringToBool(String value) {
    switch (value.toLowerCase()) {
      case 'true':
        return true;
      case 'false':
        return false;
      default:
        throw 'Ошибка типа данных: значение IsFeatured не может быть преобразовано в bool';
    }
  }

  /// Get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Products based on the Query
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Products based on the Query
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
        ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
        : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();

      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
        ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
        : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      final productQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      List<ProductModel> products = productQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var product in products) {
        // Получаем данные изображения для thumbnail
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Генерация пути для загрузки (без вложенных папок)
        String thumbnailPath = 'Products/Images/${product.id}_thumbnail.png';
        final thumbnailUrl = await storage.uploadImageData(thumbnailPath, thumbnail, product.thumbnail.toString());
        product.thumbnail = thumbnailUrl;

        // Загружаем остальные изображения, если они есть
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);
            String imagePath = 'Products/Images/${product.id}_${image.hashCode}.png';
            final url = await storage.uploadImageData(imagePath, assetImage, image);
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Загружаем вариации товаров, если они есть
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageDataFromAssets(variation.image);
            String variationImagePath = 'Products/Images/${product.id}_variation_${variation.id}.png';  // Путь для вариаций
            final url = await storage.uploadImageData(variationImagePath, assetImage, variation.image);
            variation.image = url;
          }
        }

        // Загружаем данные товара в Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
