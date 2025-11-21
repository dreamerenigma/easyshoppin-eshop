import 'package:easyshoppin_eshop/routes/custom_page_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../../message_chat_screen.dart';

class SellersChatItem extends StatelessWidget {
  final String username;
  final String message;
  final String time;
  final bool isLastItem;

  const SellersChatItem({
    super.key,
    required this.username,
    required this.message,
    required this.time,
    required this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          createPageRoute(
            MessageChatScreen(
              username: username,
              message: message,
              icon: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(shape: BoxShape.circle, color: TColors.darkerGrey),
                child: const Icon(SolarIconsBold.shop, color: TColors.darkGrey),
              ),
              showAdditionalIcon: true,
              appBarHeight: 105,
              showNotificationIcon: true,
              isFromSupportChatItem: false,
            ),
          ),
        );
      },
      splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: TColors.darkGrey),
                  child: const Icon(Iconsax.shop, color: TColors.white),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              username,
                              style: const TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              time,
                              style: const TextStyle(fontSize: TSizes.fontSizeLm, color: TColors.darkGrey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          message,
                          style: const TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!isLastItem)
            Padding(
              padding: const EdgeInsets.only(left: 55, top: 10),
              child: const Divider(
                color: TColors.darkerGrey,
                height: 1.0,
                thickness: 1.0,
              ),
            ),
            if (isLastItem)
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
