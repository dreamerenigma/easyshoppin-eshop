import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/features/shop/models/category_model.dart';
import 'package:easyshoppin_eshop/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/product_category_model.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);
        final url = await storage.uploadImageData('Categories', file, category.name);

        category.image = url;

        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Categories to the Cloud Firestore
  Future<void> uploadProductCategoryDummyData(List<ProductCategoryModel> productCategories) async {
    try {
      for (var category in productCategories) {
        await _db.collection("ProductCategory").doc(category.categoryId).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
