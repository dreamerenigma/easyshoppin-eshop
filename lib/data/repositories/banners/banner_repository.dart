import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/features/shop/models/banner_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all older related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
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

  /// Upload Banners to Firestore
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final batch = _db.batch();

      for (var banner in banners) {
        final docRef = _db.collection('Banners').doc();
        batch.set(docRef, banner.toJson());
      }

      await batch.commit();
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
}
