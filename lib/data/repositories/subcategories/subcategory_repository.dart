import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/sub_category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class SubCategoryRepository extends GetxController {
  static SubCategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all Sub Categories
  Future<List<SubCategoryModel>> getAllSubCategories() async {
    try {
      final snapshot = await _db.collection('SubCategories').get();
      final list = snapshot.docs.map((document) => SubCategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload SubCategories to the Cloud Firebase
  Future<void> uploadDummyData(List<SubCategoryModel> subcategories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var subcategory in subcategories) {
        final file = await storage.getImageDataFromAssets(subcategory.image);
        final url = await storage.uploadImageData('SubCategories', file, subcategory.name);

        subcategory.image = url;

        await _db.collection("SubCategories").doc(subcategory.id).set(subcategory.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Sub Categories (подкатегории)
  Future<List<SubCategoryModel>> getSubCategories(String categoryId) async {
    try {
      log('Fetching subcategories from Firebase for category: $categoryId');
      final snapshot = await _db.collection("SubCategories").where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => SubCategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
