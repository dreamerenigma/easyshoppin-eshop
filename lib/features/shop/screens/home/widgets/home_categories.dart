import 'package:easyshoppin_eshop/features/shop/controllers/category_controller.dart';
import 'package:easyshoppin_eshop/features/shop/screens/sub_category/subcategories_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../models/category_model.dart';

class THomeCategories extends StatefulWidget {
  final List<CategoryModel> allCategories;

  const THomeCategories({
    super.key,
    required this.allCategories,
  });

  @override
  State<THomeCategories> createState() => _THomeCategoriesState();
}

class _THomeCategoriesState extends State<THomeCategories> {
  final categoryController = Get.put(CategoryController());
  final ScrollController _controller = ScrollController();
  final double scrollAmount = 200;
  bool showLeft = false;
  bool showRight = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateArrows();
    });

    _controller.addListener(_updateArrows);
  }

  void _updateArrows() {
    if (!_controller.hasClients) return;

    final max = _controller.position.maxScrollExtent;
    final offset = _controller.offset;

    setState(() {
      if (max == 0) {
        showLeft = false;
        showRight = false;
        return;
      }

      showLeft = offset > 0;
      showRight = offset < max;
    });
  }

  void scrollLeft() {
    _controller.animateTo(
      (_controller.offset - scrollAmount).clamp(0, _controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollRight() {
    _controller.animateTo(
      (_controller.offset + scrollAmount).clamp(0, _controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (categoryController.isLoading.value) return const TCategoryShimmer();

        if (categoryController.featuredCategories.isEmpty) {
          return Center(child: Text(S.of(context).noDataFound, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)));
        }

        final limitedCategories = categoryController.featuredCategories.take(8).toList();

        return SizedBox(
          height: 120,
          child: Stack(
            children: [
              /// --- Горизонтальный список ---
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: (details) {
                    _controller.jumpTo((_controller.offset - details.delta.dx).clamp(0, _controller.position.maxScrollExtent));
                  },
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: limitedCategories.length,
                      itemBuilder: (_, index) {
                        final category = limitedCategories[index];
                        return TVerticalImageText(
                          image: category.image,
                          imageSize: 100,
                          title: category.name,
                          padding: 0,
                          onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
                        );
                      },
                    ),
                  ),
                ),
              ),
              /// --- Левая стрелка ---
              if (showLeft)
                Align(
                  alignment: Alignment.centerLeft,
                  child: _ArrowButton(icon: Icons.arrow_back_ios_new, onTap: scrollLeft),
                ),
              /// --- Правая стрелка ---
              if (showRight)
                Align(
                  alignment: Alignment.centerRight,
                  child: _ArrowButton(icon: Icons.arrow_forward_ios, onTap: scrollRight),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(color: TColors.white, shape: BoxShape.circle),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 18, color: TColors.black),
        onPressed: onTap,
      ),
    );
  }
}
