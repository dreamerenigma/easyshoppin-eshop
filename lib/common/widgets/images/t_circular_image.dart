import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    this.isSquare = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.lightSoftNight : TColors.white),
        borderRadius: isSquare ? BorderRadius.all(Radius.circular(TSizes.borderRadiusXl)) : BorderRadius.circular(100),
      ),
      child: ClipRRect(
        child: Center(
          child: isNetworkImage
            ? CachedNetworkImage(
              fit: fit,
              color: overlayColor,
              imageUrl: image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : Image(
              fit: fit ?? BoxFit.cover,
              image: AssetImage(image),
              color: overlayColor,
            ),
        ),
      ),
    );
  }
}
