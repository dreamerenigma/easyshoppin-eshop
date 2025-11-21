import 'package:flutter/material.dart';
import '../../../utils/constants/app_sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;

    if (screenWidth >= 1200) {
      crossAxisCount = 5;
    } else if (screenWidth >= 750) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 2;
    }

    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: TSizes.gridViewSpacingSmall,
        crossAxisSpacing: TSizes.gridViewSpacingSmall,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
