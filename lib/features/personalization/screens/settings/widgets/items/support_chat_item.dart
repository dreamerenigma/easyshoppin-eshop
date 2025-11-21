import 'package:easyshoppin_eshop/routes/custom_page_route.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../../message_chat_screen.dart';

class SupportChatItem extends StatelessWidget {
  final String username;
  final String message;
  final String time;

  const SupportChatItem({
    super.key,
    required this.username,
    required this.message,
    required this.time,
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
                decoration: BoxDecoration(shape: BoxShape.circle, color: TColors.blue),
                child: const Icon(Icons.person, color: TColors.white),
              ),
              appBarHeight: 65,
              showNotificationIcon: false,
              isFromSupportChatItem: true,
            ),
          ),
        );
      },
      splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 10),
        decoration: BoxDecoration(color: TColors.darkerGrey.withAlpha((0.3 * 255).toInt())),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: TColors.blue),
                  child: const Icon(Icons.person, color: TColors.white),
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
                            padding: const EdgeInsets.only(left: 12, right: 12),
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
            Padding(
              padding: const EdgeInsets.only(left: 55, top: 10),
              child: const Divider(
                color: TColors.darkerGrey,
                height: 1.0,
                thickness: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
