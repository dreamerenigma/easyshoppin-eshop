import 'package:cloud_firestore/cloud_firestore.dart';

class SaleModel {
  String id;
  String imageUrl;
  String name;
  final String targetScreen;
  final bool active;

  SaleModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'ImageUrl': imageUrl,
      'Name': name,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory SaleModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return SaleModel(
      id: snapshot.id,
      imageUrl: data['ImageUrl'] ?? '',
      name: data['Name'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? true,
    );
  }
}
