import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/sale_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class SaleRepository extends GetxController {
  static SaleRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all older related to current User
  Future<List<SaleModel>> fetchSales() async {
    try {
      final result = await _db.collection('Sales').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => SaleModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<SaleModel> sales) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var sale in sales) {
        final file = await storage.getImageDataFromAssets(sale.imageUrl);
        final url = await storage.uploadImageData('Sales', file, sale.name);

        sale.imageUrl = url;

        await _db.collection("Sales").doc(sale.id).set(sale.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Sales to Firestore
  Future<void> uploadSalesDummyData(List<SaleModel> sales) async {
    try {
      final batch = _db.batch();

      for (var sales in sales) {
        final docRef = _db.collection('Sales').doc();
        batch.set(docRef, sales.toJson());
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      log('Error uploading sales: $e');
      throw 'Something went wrong. Please try again';
    }
  }
}
