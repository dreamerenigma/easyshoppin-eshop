import 'package:carousel_slider/carousel_slider.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    final logger = Logger();
    return Obx(
          () {
        // Loader
        if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190);

        // No data found
        if (controller.banners.isEmpty) {
          return Center(child: Text(S.of(context).noDataFound));
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16/9,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    controller.updatePageIndicator(index);
                  },
                ),
                items: controller.banners.map(
                      (banner) => TRoundedImage(
                    imageUrl: banner.imageUrl,
                    isNetworkImage: Uri.parse(banner.imageUrl).isAbsolute,
                    onPressed: () {
                      logger.d('Navigating to: ${banner.targetScreen}');
                      Get.toNamed(banner.targetScreen);
                    },
                  ),
                ).toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: Obx(
                      () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        TCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

