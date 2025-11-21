import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  SubCategoryModel ({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  static SubCategoryModel empty() => SubCategoryModel(id: '', image: '', name: '', isFeatured: false);

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory SubCategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return SubCategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['isFeatured'] ?? true,
      );
    } else {
      return SubCategoryModel.empty();
    }
  }
}
