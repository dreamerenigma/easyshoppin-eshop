import 'package:cached_network_image/cached_network_image.dart';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:easyshoppin_eshop/common/widgets/images/t_rounded_image.dart';
import 'package:easyshoppin_eshop/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/product/images_controller.dart';
import 'package:easyshoppin_eshop/features/shop/models/product_model.dart';
import 'package:easyshoppin_eshop/utils/constants/colors.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Obx(
                  () {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress, color: TColors.primary)
                      ),
                    );
                  },
                )),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final itemSelected = controller.selectedProductImage.value == images[index];
                      return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        imageUrl: images[index],
                        padding: const EdgeInsets.all(TSizes.sm),
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        onPressed: () => controller.selectedProductImage.value = images[index],
                        border: Border.all(color: itemSelected? TColors.primary : Colors.transparent),
                      );
                    },
                  ),
                ),
              ),
            ),

            /// Appbar Icons
            TAppBar(
              showBackArrow: true,
              actions: [TFavouriteIcon(productId: product.id)],
            ),
          ],
        ),
      ),
    );
  }
}
