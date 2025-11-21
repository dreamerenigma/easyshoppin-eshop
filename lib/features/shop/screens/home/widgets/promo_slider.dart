import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:easyshoppin_eshop/features/shop/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    final double carouselHeight = Platform.isWindows ? 180 : 114;
    final double viewportFraction = Platform.isWindows ? 0.3 : 1.03;

    return Obx(
      () {
        if (controller.isLoading.value) {
          return Padding(
            padding: const EdgeInsets.only(bottom: TSizes.spaceBtwLittle),
            child: const TShimmerEffect(width: double.infinity, height: 114),
          );
        }

        if (controller.banners.isEmpty) {
          return Center(child: Text(S.of(context).noDataFound));
        } else {
          return Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1700),
                child: CarouselSlider.builder(
                  itemCount: controller.banners.length,
                  itemBuilder: (context, index, realIndex) {
                    final bool isActive = controller.carouselCurrentIndex.value == index;
                    final scale = isActive ? 1.0 : 0.9;

                    return Transform.scale(
                      scale: scale,
                      child: TRoundedImage(
                        imageUrl: controller.banners[index].imageUrl,
                        isNetworkImage: Uri.parse(controller.banners[index].imageUrl).isAbsolute,
                        onPressed: () {
                          Logger().d('Navigating to: ${controller.banners[index].targetScreen}');
                          Get.toNamed(controller.banners[index].targetScreen);
                        },
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    height: carouselHeight,
                    viewportFraction: viewportFraction,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      controller.updatePageIndicator(index);
                    },
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwLittle),
            ],
          );
        }
      },
    );
  }
}
