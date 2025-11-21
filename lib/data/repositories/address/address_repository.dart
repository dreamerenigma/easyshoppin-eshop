import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';
import '../../../features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) throw 'Unable to find user information. Try again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Addresses').get();
      return result.docs.map((documentSnapshot) => AddressModel.fromDocumentSnapshot(documentSnapshot)).toList();

    } catch (e) {
      throw 'Something went wrong while fetching Address Information. Try again later';
    }
  }

  /// Clear the "selected" field for all addresses
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      await _db.collection('Users').doc(userId).collection('Addresses').doc(addressId).update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to update your address selection. Try again later';
    }
  }

  /// Sore new user order
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      final currentAddress = await _db.collection('Users').doc(userId).collection('Addresses').add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Unable to update your address selection. Try again later';
    }
  }
}
