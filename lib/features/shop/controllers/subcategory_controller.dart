import 'dart:developer';
import 'package:easyshoppin_eshop/features/shop/models/sub_category_model.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:get/get.dart';
import '../../../data/repositories/subcategories/subcategory_repository.dart';

class SubCategoryController extends GetxController {
  static SubCategoryController get instance => Get.find();
  final isLoading = false.obs;
  final _subCategoryRepository = Get.put(SubCategoryRepository());
  RxList<SubCategoryModel> allSubCategories = <SubCategoryModel>[].obs;
  RxList<SubCategoryModel> featuredSubCategories = <SubCategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final categoryId = Get.arguments as String?;
    if (categoryId != null) {
      fetchSubCategories(categoryId);
    }
  }

  /// -- Load all subcategories
  Future<void> fetchSubCategories(String categoryId) async {
    try {
      isLoading.value = true;
      final subCategories = await _subCategoryRepository.getAllSubCategories();

      // Фильтруем подкатегории по parentId
      final filteredSubCategories = subCategories.where((subCategory) => subCategory.parentId == categoryId).toList();

      log('Loaded subcategories for category: $categoryId');
      log('Filtered subcategories count: ${filteredSubCategories.length}');

      allSubCategories.assignAll(filteredSubCategories);
      featuredSubCategories.assignAll(
        filteredSubCategories.where((subCategory) => subCategory.isFeatured).take(50).toList()
      );
    } catch (e) {
      log("Error loading subcategories: $e");
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Get subcategories for a specific category
  Future<List<SubCategoryModel>> getSubCategories(String categoryId) async {
    try {
      isLoading.value = true;
      final subCategories = await _subCategoryRepository.getSubCategories(categoryId);

      log('Loaded subcategories for category: $categoryId');
      log('Subcategories: $subCategories');

      allSubCategories.assignAll(subCategories);
      featuredSubCategories.assignAll(
        subCategories.where((subCategory) => subCategory.isFeatured).take(50).toList()
      );

      return subCategories;
    } catch (e) {
      log("Error loading subcategories: $e");
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}
