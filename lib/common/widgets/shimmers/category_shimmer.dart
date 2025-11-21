import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../utils/constants/app_sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: SizedBox(
        height: 120,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, _) => const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_, _) {
            return SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  TShimmerEffect(width: 100, height: 100),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  /// Text
                  TShimmerEffect(width: 55, height: 8),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
