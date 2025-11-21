import 'dart:developer';
import 'package:easyshoppin_eshop/common/widgets/images/t_rounded_image.dart';
import 'package:easyshoppin_eshop/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:easyshoppin_eshop/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/product/product_controller.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../features/shop/screens/product_details/widgets/rating_share_widget.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_vectors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../search_image/search_image_icon.dart';
import 'product_card_add_to_cart_button.dart';
import 'dialogs/products_bottom_sheet_dialog.dart';

class TProductCardVertical extends StatefulWidget {
  final ProductModel product;
  const TProductCardVertical({super.key, required this.product});

  @override
  State<TProductCardVertical> createState() => _TProductCardVerticalState();
}

class _TProductCardVerticalState extends State<TProductCardVertical> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(widget.product.price, widget.product.salePrice);
    log('Original Price: ${widget.product.price}, Sale Price: ${widget.product.salePrice}');
    final darkMode = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: widget.product)),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: darkMode ? TColors.darkerGrey.withAlpha((0.5 * 255).toInt()) : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              width: double.infinity,
              backgroundColor: darkMode ? TColors.darkSlate : TColors.light,
              child: Stack(
                children: [
                  /// -- Карусель изображений
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: (widget.product.images != null && widget.product.images!.isNotEmpty)
                      ? PageView.builder(
                          controller: pageController,
                          itemCount: widget.product.images!.length,
                          onPageChanged: (index) {
                            setState(() {});
                          },
                          itemBuilder: (context, index) {
                            return Center(
                              child: TRoundedImage(
                                key: ValueKey<String>(widget.product.images![index]),
                                imageUrl: widget.product.images![index],
                                applyImageRadius: true,
                                isNetworkImage: true,
                              ),
                            );
                          },
                        )
                      : Center(
                          child: TRoundedImage(
                            key: ValueKey<String>(widget.product.thumbnail),
                            imageUrl: widget.product.thumbnail,
                            applyImageRadius: true,
                            isNetworkImage: true,
                          ),
                        ),
                  ),
                  /// -- Sale Tag
                  if (salePercentage != null)
                  Positioned(
                    bottom: 0,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      enableTopLeftRadius: false,
                      backgroundColor: TColors.secondary.withAlpha((0.8 * 255).toInt()),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: 2),
                      child: Text('-$salePercentage%', style: TextStyle(color: TColors.youngNight, fontSize: TSizes.fontSizeLm)),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(TSizes.xs),
                      child: TFavouriteIcon(productId: widget.product.id),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.all(TSizes.xs),
                      child: TSearchImageIcon(productId: widget.product.id),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 3),
            /// -- Pagination dots
            widget.product.images != null && widget.product.images!.isNotEmpty
                ? SmoothPageIndicator(
                  controller: pageController,
                  count: widget.product.images!.length,
                  effect: WormEffect(
                    activeDotColor: TColors.blue,
                    dotColor: TColors.grey,
                    dotHeight: 3,
                    dotWidth: 3,
                    spacing: 4,
                  ),
                )
              : SizedBox.shrink(),
            const SizedBox(height: TSizes.spaceBtwItemsSmall / 4),
            /// -- Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(TVectors.discount, width: 14, height: 14, colorFilter: const ColorFilter.mode(TColors.red, BlendMode.srcIn)),
                            const SizedBox(width: TSizes.xs),
                            TProductPriceText(price: controller.getProductPrice(widget.product)),
                          ],
                        ),
                      ),
                      if (widget.product.productType == ProductType.single.toString() && widget.product.salePrice > 0)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm, top: 3),
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: '${widget.product.price} ₽',
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).textTheme.labelMedium!.color,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: darkMode ? Theme.of(context).textTheme.labelMedium!.color : TColors.black,
                                decorationThickness: 1.5,
                                fontSize: TSizes.fontSizeLm,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Material(
                    color: TColors.transparent,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                          backgroundColor: darkMode ? TColors.youngNight : TColors.grey,
                          builder: (BuildContext context) {
                            return const ProductsBottomSheetDialog();
                          },
                          isScrollControlled: true,
                        );
                      },
                      splashColor: TColors.black.withAlpha((0.2 * 255).toInt()),
                      highlightColor: TColors.black.withAlpha((0.2 * 255).toInt()),
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(PhosphorIcons.eyeSlash(), color: TColors.buttonGrey, size: 22),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('с ES Кошельком', style: TextStyle(color: TColors.red, fontSize: TSizes.fontSizeLm)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TBrandTitleWithVerifiedIcon(title: widget.product.brand!.name),
                    const SizedBox(height: TSizes.spaceBtwDefault / 4),
                    TProductTitleText(title: widget.product.title, smallSize: true),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm, top: TSizes.xs),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Rating & Share Button
                    const TRatingAndShare(showShareIcon: false),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ProductCardAddToCartButton(product: widget.product, showDialogOnRemove: true),
            ),
          ],
        ),
      ),
    );
  }
}
