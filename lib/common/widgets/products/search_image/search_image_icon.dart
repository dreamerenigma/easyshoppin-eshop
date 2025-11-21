import 'package:easyshoppin_eshop/common/widgets/icons/t_circular_icon.dart';
import 'package:easyshoppin_eshop/utils/constants/app_vectors.dart';
import 'package:flutter/material.dart';
import '../../../../features/shop/screens/similar_products/find_similar_products_screen.dart';
import '../../../../routes/custom_page_route.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchImageIcon extends StatelessWidget {
  const TSearchImageIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final imageAssetPath = darkMode ? TVectors.searchImageLight : TVectors.searchImageDark;

    return TCircularIcon(
      svgAssetPath: imageAssetPath,
      onPressed: () {
        Navigator.push(context, createPageRoute(const FindSimilarProductsScreen()));
      },
      size: 24,
      height: 40,
      width: 40,
    );
  }
}
