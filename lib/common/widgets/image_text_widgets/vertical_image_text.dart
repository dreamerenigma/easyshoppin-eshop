import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/app_sizes.dart';
import '../images/t_circular_image.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
    this.isSquare = false,
    this.overlayColor,
    this.padding = TSizes.sm,
    this.imageSize = 70,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  final bool isSquare;
  final Color? overlayColor;
  final double padding;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircularImage(
              width: imageSize,
              height: imageSize,
              image: image,
              isSquare: true,
              fit: BoxFit.cover,
              padding: padding,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: overlayColor,
            ),
            SizedBox(
              width: imageSize,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
