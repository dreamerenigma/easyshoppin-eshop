import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../../utils/popups/loaders.dart';

class ChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String username;
  final String message;
  final Widget icon;
  final bool showAdditionalIcon;
  final double appBarHeight;
  final bool showBackArrow;
  final bool showNotificationIcon;
  final bool isFromSupportChatItem;

  const ChatAppBar({
    super.key,
    required this.username,
    required this.message,
    required this.icon,
    this.showAdditionalIcon = false,
    this.appBarHeight = 65,
    this.showBackArrow = true,
    this.showNotificationIcon = true,
    this.isFromSupportChatItem = false,
  });

  @override
  State<ChatAppBar> createState() => ChatAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class ChatAppBarState extends State<ChatAppBar> {
  bool isNotificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationState();
  }

  Future<void> _loadNotificationState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isNotificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
    });
  }

  void toggleNotifications() async {
    setState(() {
      isNotificationsEnabled = !isNotificationsEnabled;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', isNotificationsEnabled);

    if (!mounted) return;

    if (isNotificationsEnabled) {
      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        'Уведомления включены',
        icon: const Icon(Ionicons.checkmark_circle),
        iconColor: TColors.green,
        backgroundColor: TColors.green.withAlpha((0.5 * 255).toInt()));
    } else {
      CustomIconSnackBar.showAnimatedSnackBar(
        context,
        'Уведомления отключены',
        icon: const Icon(Icons.error_outline_outlined),
        iconColor: TColors.orange,
        backgroundColor: TColors.orange.withAlpha((0.5 * 255).toInt()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 4.0,
      toolbarHeight: widget.appBarHeight,
      titleSpacing: 0,
      title: Padding(
        padding: widget.isFromSupportChatItem ? EdgeInsets.zero : const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (widget.showBackArrow)
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColors.transparent,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: TColors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: TColors.darkerGrey.withAlpha((0.7 * 255).toInt()),
                  highlightColor: TColors.darkerGrey.withAlpha((0.7 * 255).toInt()),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusXs),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            widget.icon,
                            if (isNotificationsEnabled  && widget.showNotificationIcon)
                              Positioned(
                                top: -4,
                                left: 26,
                                child: Icon(
                                  Icons.notifications_off_outlined,
                                  size: 17,
                                  color: dark ? TColors.white : TColors.black,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.username,
                              style: const TextStyle(
                                fontSize: TSizes.fontSizeMd,
                                fontWeight: FontWeight.w500,
                                color: TColors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.message,
                              style: const TextStyle(
                                fontSize: TSizes.fontSizeSm,
                                color: TColors.darkGrey,
                                fontWeight: FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (widget.showAdditionalIcon)
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: toggleNotifications,
                    splashColor: TColors.darkGrey.withAlpha((0.4 * 255).toInt()),
                    highlightColor: TColors.darkGrey.withAlpha((0.4 * 255).toInt()),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusXs),
                      topRight: Radius.circular(TSizes.cardRadiusXs),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      child: Row(
                        children: [
                          Icon(isNotificationsEnabled ? Icons.notifications : Icons.notifications_off_outlined, size: 16, color: dark ? TColors.darkGrey : TColors.grey),
                          const SizedBox(width: 4),
                          Text(isNotificationsEnabled ? 'Включить уведомления' : 'Выключить уведомления',
                            style: const TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: TColors.darkGrey.withAlpha((0.4 * 255).toInt()),
                    highlightColor: TColors.darkGrey.withAlpha((0.4 * 255).toInt()),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusXs),
                      topRight: Radius.circular(TSizes.cardRadiusXs),
                    ),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 51.5, vertical: 12),
                      child: Row(
                        children: [
                          Icon(Icons.archive_outlined, size: 16, color: dark ? TColors.darkGrey : TColors.grey),
                          const SizedBox(width: 4),
                          const Text('В архив', style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.darkGrey, fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
