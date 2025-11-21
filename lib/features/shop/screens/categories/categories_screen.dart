import 'package:easyshoppin_eshop/features/shop/screens/search_field/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../routes/custom_page_route.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../utils/widgets/no_glow_scroll_behavior.dart';
import '../../controllers/category_controller.dart';
import '../sub_category/subcategories_screen.dart';
import '../sub_category/widgets/banner_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  final categoryController = Get.put(CategoryController());

  Future<void> _reloadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final allCategories = categoryController.allCategories;

    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: const Text('Категории', style: TextStyle(fontSize: TSizes.fontSizeXl)),
        actions: [
          Container(
            height: TSizes.spaceBtwSectionsExpanded,
            decoration: BoxDecoration(color: TColors.buttonSecondary, borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, createPageRoute(SearchScreen(searchText: '')));
              },
              color: TColors.white,
              iconSize: 24,
            ),
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: _reloadData,
          displacement: 5,
          color: TColors.primary,
          backgroundColor: TColors.buttonDarkGrey,
          child: Obx(() {
            if (categoryController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
                    child: BannerWidget(
                      categoryName: allCategories.first.name,
                      allCategories: allCategories,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(TSizes.spaceBtwItemsSmall),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        final category = categoryController.featuredCategories[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: TColors.blackGrey,
                            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                          ),
                          child: Material(
                            color: TColors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => SubCategoriesScreen(category: category));
                              },
                              splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                              highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.network(category.image, fit: BoxFit.contain),
                                    ),
                                  ),
                                  Positioned(
                                    left: 8,
                                    top: 8,
                                    child: SizedBox(
                                      width: 80,
                                      child: Text(
                                        category.name,
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
                          ),
                        );
                      },
                      childCount: categoryController.featuredCategories.length,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
