import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:easyshoppin_eshop/features/shop/screens/all_products/all_products.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/custom_tab.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/home_appbar_windows.dart';
import 'package:easyshoppin_eshop/features/shop/screens/home/widgets/home_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/platforms/platform_utils.dart';
import '../../../utils/widgets/no_glow_scroll_behavior.dart';
import '../../../utils/widgets/no_scrollbar_scroll_behavior.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  late final ProductController controller;
  late final CategoryController categoriesController;
  late TabController _tabController;
  late FocusNode _focusNode;
  final isResizing = false.obs;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProductController());
    categoriesController = Get.put(CategoryController());
    _focusNode = FocusNode();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _reloadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget appBarWidget = _buildAppBarWidget();
    bool isNarrow = MediaQuery.of(context).size.width < 1040;
    final screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = (screenWidth - 1400) / 2;
    if (horizontalPadding < 0) horizontalPadding = 0;

    Widget scrollableContent = ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: RefreshIndicator(
        onRefresh: _reloadData,
        displacement: 30,
        color: TColors.primary,
        backgroundColor: TColors.buttonDarkGrey,
        child: Padding(
          padding: EdgeInsets.only(top: isNarrow ? 30 : 0),
          child: RawScrollbar(
            controller: scrollController,
            radius: const Radius.circular(12),
            thickness: 8,
            thumbColor: TColors.darkGrey.withAlpha((0.7 * 255).toInt()),
            trackColor: TColors.darkGrey.withAlpha((0.2 * 255).toInt()),
            trackRadius: const Radius.circular(12),
            child: ScrollConfiguration(
              behavior: NoScrollbarScrollBehavior(),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    /// Header -- Tutorial [Section # 3, Video # 2]
                    HomeBody(focusNode: _focusNode, categoriesController: categoriesController),
                    /// Body -- Tutorial [Section # 3, Video # 5]
                    Column(
                      children: [
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                child: DefaultTabController(
                                  length: 3,
                                  child: Column(
                                    children: [
                                      AnimatedBuilder(
                                        animation: _tabController,
                                        builder: (context, _) {
                                          return Align(
                                            alignment: Alignment.centerLeft,
                                            child: TabBar(
                                              controller: _tabController,
                                              isScrollable: false,
                                              tabs: List.generate(3, (index) {
                                                return CustomTab(
                                                  icon: index == 0 ? Icons.fiber_new : null,
                                                  text: ['Новинки', 'Распродажа', 'Бестселлеры'][index],
                                                  isSelected: _tabController.index == index,
                                                );
                                              }),
                                              indicator: BoxDecoration(),
                                              indicatorColor: TColors.transparent,
                                              indicatorSize: TabBarIndicatorSize.tab,
                                              dividerColor: TColors.transparent,
                                              padding: EdgeInsets.zero,
                                              labelPadding: const EdgeInsets.only(left: 10),
                                              tabAlignment: TabAlignment.center,
                                              overlayColor: WidgetStateProperty.all(TColors.transparent),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 300,
                                        child: TabBarView(
                                          key: PageStorageKey('tabView'),
                                          controller: _tabController,
                                          children: [
                                            Center(child: Text('«Новинки»🆕', style: TextStyle(fontSize: TSizes.fontSizeLg))),
                                            Center(child: Text('«Распродажи»🔥', style: TextStyle(fontSize: TSizes.fontSizeLg))),
                                            Center(child: Text('«Бестселлеры»👑', style: TextStyle(fontSize: TSizes.fontSizeLg))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItemsSmall),
                        /// -- Heading
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1450),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: isWebOrWindows ? 20 : 0),
                            child: Column(
                              children: [
                                TSectionHeading(
                                  title: S.of(context).popularProducts,
                                  onPressed: () => Get.to(
                                    () => AllProducts(
                                      title: S.of(context).popularProducts,
                                      query: FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6),
                                      futureMethod: controller.fetchAllFeaturedProducts(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: TSizes.spaceBtwLittle),
                                /// -- Popular Products -- Tutorial [Section # 3, Video # 6]
                                Obx(() {
                                  if (controller.isLoading.value) return const TVerticalProductShimmer();

                                  if (controller.featuredProducts.isEmpty) {
                                    log('Не найдено избранных товаров!');
                                    return Center(child: Text(S.of(context).noDataFound, style: Theme.of(context).textTheme.bodyMedium));
                                  }
                                  log('Отображаем товары: ${controller.featuredProducts.length}');
                                  return TGridLayout(
                                    itemCount: controller.featuredProducts.length,
                                    itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                                    mainAxisExtent: 365,
                                  );
                                }),
                                const SizedBox(height: TSizes.spaceBtwSections),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(top: Platform.isWindows ? 70 : 0),
              child: scrollableContent,
            ),
          ),
          if (Platform.isWindows)
            Positioned(top: 0, left: 0, right: 0, child: appBarWidget),
        ],
      ),
    );
  }

  Widget _buildAppBarWidget() {
    if (defaultTargetPlatform == TargetPlatform.windows) {
      return const THomeAppBarWindows();
    } else {
      return const THomeAppBar();
    }
  }
}
