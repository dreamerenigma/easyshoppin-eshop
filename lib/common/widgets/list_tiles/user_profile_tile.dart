import 'package:easyshoppin_eshop/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_images.dart';
import '../../../utils/constants/app_sizes.dart';
import '../shimmers/shimmer.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed,
    this.profilePictureSize = 50.0,
    this.iconSize = 24.0,
    this.padding = const EdgeInsets.only(left: 16.0, right: 8, top: 12.0, bottom: 12.0),
  });

  final VoidCallback onPressed;
  final double profilePictureSize;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Container(
      padding: padding,
      child: Row(
        children: [
          Obx(() {
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : TImages.user;
            return controller.imageUploading.value ? const TShimmerEffect(width: 50, height: 50, radius: 50) :
            Container(
              width: profilePictureSize,
              height: profilePictureSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: networkImage.isNotEmpty ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.user.value.fullName,
                  style: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold, color: TColors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  controller.user.value.email,
                  style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400, color: TColors.white.withAlpha((0.7 * 255).toInt())),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Material(
            color: TColors.transparent,
            child: InkWell(
              onTap: onPressed,
              splashColor: TColors.black.withAlpha((0.1 * 255).toInt()),
              highlightColor: TColors.black.withAlpha((0.1 * 255).toInt()),
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(Iconsax.edit, color: TColors.white, size: iconSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
