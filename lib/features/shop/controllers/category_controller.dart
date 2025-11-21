import 'package:easyshoppin_eshop/data/repositories/categories/category_repository.dart';
import 'package:easyshoppin_eshop/data/repositories/product/product_repository.dart';
import 'package:easyshoppin_eshop/features/shop/models/category_model.dart';
import 'package:easyshoppin_eshop/features/shop/models/product_model.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final logger = Logger();
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();
      logger.d('Loaded categories from Firebase:');
      for (var category in categories) {
        logger.d('Category: ${category.name}, isFeatured: ${category.isFeatured}, parentId: ${category.parentId}');
      }

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(22).toList());

      return categories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Category or Sub-Category Products.
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
