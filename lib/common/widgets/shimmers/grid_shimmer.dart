import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:easyshoppin_eshop/utils/constants/app_sizes.dart';

class TGridShimmer extends StatelessWidget {
  final int itemCount;
  final double aspectRatio;

  const TGridShimmer({
    super.key,
    this.itemCount = 8,
    this.aspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    double itemSize = 70;

    return SizedBox(
      height: itemSize,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: TSizes.spaceBtwItems,
          childAspectRatio: aspectRatio,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return TShimmerEffect(width: itemSize, height: itemSize);
        },
      ),
    );
  }
}
