import 'dart:developer';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/features/shop/models/category_model.dart';
import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/subcategory_controller.dart';

class SubCategoriesScreen extends StatelessWidget {
  final CategoryModel category;

  const SubCategoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final subCategoryController = Get.put(SubCategoryController());
    subCategoryController.fetchSubCategories(category.id);

    return Scaffold(
      appBar: TAppBar(title: Text(category.name, style: TextStyle(fontSize: TSizes.fontSizeXl)), showBackArrow: true),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: TSizes.lg, right: TSizes.lg, bottom: TSizes.lg),
            child: Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwItemsSmall),
                Obx(() {
                  if (subCategoryController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(TColors.primary)));
                  }

                  log('Featured subcategories count: ${subCategoryController.featuredSubCategories.length}');

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: subCategoryController.featuredSubCategories.length,
                    itemBuilder: (_, index) {
                      final subCategory = subCategoryController.featuredSubCategories[index];

                      return InkWell(
                        onTap: () {},
                        splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                        highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                        child: Container(
                          decoration: BoxDecoration(
                            color: TColors.blackGrey,
                            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Image.network(subCategory.image, fit: BoxFit.contain),
                                ),
                              ),
                              Positioned(
                                left: 8,
                                top: 8,
                                child: SizedBox(
                                  width: 80,
                                  child: Text(
                                    subCategory.name,
                                    style: TextStyle(color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark, fontSize: TSizes.fontSizeLm),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
