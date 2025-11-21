import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/sale_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/platforms/platform_utils.dart';
import '../../../controllers/category_controller.dart';
import '../../all_categories/all_categories.dart';
import 'home_appbar.dart';
import 'home_appbar_windows.dart';
import 'home_categories.dart';

class HomeBody extends StatefulWidget {
  final FocusNode focusNode;
  final CategoryController categoriesController;

  const HomeBody({
    super.key,
    required this.focusNode,
    required this.categoriesController,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    bool isNarrow = MediaQuery.of(context).size.width < 1040;

    return TPrimaryHeaderContainer(
      child: Center(
        child: Column(
          children: [
            /// -- AppBar -- Tutorial [Section # 3, Video # 3]
            if (!Platform.isWindows) buildAppBarWidget(),
            if (Platform.isWindows)
              SizedBox(height: !isNarrow ? 60 : 5),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1450),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: isWebOrWindows ? TSizes.spaceBtwItemsDefault : TSizes.spaceBtwItemsSmall,
                    right: isWebOrWindows ? TSizes.spaceBtwItemsDefault : TSizes.spaceBtwItemsSmall,
                    top: isWebOrWindows ? TSizes.spaceBtwItemsSmall : 0,
                    bottom: isWebOrWindows ? TSizes.spaceBtwItemsSmall : TSizes.spaceBtwLittle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(TImages.blackFriday, fit: BoxFit.cover, height: 45),
                  ),
                ),
              ),
            /// -- Sales Slider -- Tutorial [Section # 27, Video # 1]
            const TPromoSlider(),
            /// -- SearchBar -- Tutorial [Section # 3, Video # 4]
            Platform.isWindows ? const SizedBox.shrink() : TSearchContainer(
              shouldNavigate: true,
              onChanged: (text) {},
              focusNode: widget.focusNode,
            ),
            const SizedBox(height: TSizes.spaceBtwLittle),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isWebOrWindows ? 20 : 0),
              child: Container(
                decoration: BoxDecoration(
                  color: TColors.mildNight,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: TColors.black.withAlpha((0.1 * 255).toInt()),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: isNarrow ? 8 : TSizes.spaceBtwItemsDefault, top: TSizes.spaceBtwLittle),
                            child: TSectionHeading(title: S.of(context).bestsellers, showActionButton: false, textColor: TColors.white),
                          ),
                          SizedBox(height: !Platform.isWindows ? TSizes.spaceBtwLittle : TSizes.spaceBtwItemsSmall),
                          Padding(
                            padding: EdgeInsets.only(
                              left: isWebOrWindows ? TSizes.spaceBtwItemsDefault : TSizes.spaceBtwItemsSmall,
                              bottom: TSizes.spaceBtwItemsSmall,
                            ),
                            child: const TSaleSlider(),
                          ),
                        ],
                      ),
                      /// -- Heading with TextButton
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: isNarrow ? 8 : TSizes.spaceBtwItemsDefault),
                            child: TSectionHeading(title: S.of(context).popularCategory, showActionButton: false, textColor: TColors.white),
                          ),
                          Material(
                            color: TColors.transparent,
                            child: InkWell(
                              onTap: () => Get.to(() => AllCategories(
                                title: S.of(context).popularCategory,
                                query: FirebaseFirestore.instance.collection('Categories').where('IsFeatured', isEqualTo: true).limit(6),
                                futureMethod: widget.categoriesController.fetchCategories()
                              )),
                              splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                              highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.borderRadiusMd),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(TSizes.borderRadiusMd),
                                bottomRight: Radius.circular(0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(S.of(context).viewAll, style: TextStyle(color: TColors.softGrey, fontSize: TSizes.fontSizeSm, fontWeight: FontWeight.normal)),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: TColors.softGrey,
                                        size: TSizes.iconMd,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: !Platform.isWindows ? TSizes.spaceBtwLittle : TSizes.spaceBtwItemsSmall),
                      /// Popular Categories
                      Obx(() {
                        final allCategories = widget.categoriesController.featuredCategories;
                        if (widget.categoriesController.isLoading.value) return const TCategoryShimmer();

                        if (allCategories.isEmpty) {
                          return Center(child: Text(S.of(context).noDataFound, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)));
                        }

                        return Padding(
                          padding: EdgeInsets.only(left: isWebOrWindows ? TSizes.spaceBtwItemsDefault : (!isNarrow ? 0 : TSizes.spaceBtwItems), bottom: TSizes.spaceBtwItems),
                          child: THomeCategories(allCategories: allCategories),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }

  Widget buildAppBarWidget() {
    if (defaultTargetPlatform == TargetPlatform.windows) {
      return THomeAppBarWindows(onIsNarrowChanged: (isNarrow) {
        setState(() {
          isNarrow = isNarrow;
        });
      },);
    } else {
      return const THomeAppBar();
    }
  }
}
