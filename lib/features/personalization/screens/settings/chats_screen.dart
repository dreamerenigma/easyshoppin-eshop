import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/tabs/archive_chats_tab.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/tabs/chats_tab.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/tabs/disputes_chats_tab.dart';
import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/popups/loaders.dart';

class ChatsScreen extends StatefulWidget {
  final bool notificationsEnabled;

  const ChatsScreen({super.key, this.notificationsEnabled = true});

  @override
  ChatsScreenState createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  bool notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadNotificationState();
  }

  Future<void> _loadNotificationState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationsEnabled = prefs.getBool('notifications_enabled') ?? true;
    });
  }

  void toggleNotifications() async {
    setState(() {
      notificationsEnabled = !notificationsEnabled;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', notificationsEnabled);

    if (!mounted) return;

    String message = notificationsEnabled ? S.of(context).chatNotificationEnabled : S.of(context).chatNotificationDisabled;

    CustomIconSnackBar.showAnimatedSnackBar(
      context,
      message,
      icon: notificationsEnabled ? const Icon(Icons.check) : const Icon(Icons.error_outline_outlined),
      iconColor: notificationsEnabled ? TColors.green : TColors.orange,
      backgroundColor: notificationsEnabled ? TColors.green.withAlpha((0.5 * 255).toInt()) : TColors.orange.withAlpha((0.5 * 255).toInt()),
    );
  }

  void markAllMessagesAsRead() {
    CustomIconSnackBar.showAnimatedSnackBar(
      context,
      S.of(context).allChatsRead,
      icon: const Icon(Ionicons.checkmark_circle),
      iconColor: TColors.green,
      backgroundColor: TColors.green.withAlpha((0.5 * 255).toInt()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: TAppBar(
        title: Text(S.of(context).chats, style: const TextStyle(fontSize: TSizes.fontSizeXl)),
        showBackArrow: true,
        actions: [
          Ink(
            decoration: BoxDecoration(
              color: TColors.buttonDarkGrey,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: markAllMessagesAsRead,
              splashColor: TColors.popupColor.withAlpha((0.4 * 255).toInt()),
              highlightColor: TColors.popupColor.withAlpha((0.4 * 255).toInt()),
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.message, size: TSizes.fontSizeBg, color: TColors.white),
                    const SizedBox(width: 6.0),
                    Text(S.of(context).readAll, style: const TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.white)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Ink(
              decoration: BoxDecoration(
                color: TColors.buttonDarkGrey,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                onTap: toggleNotifications,
                splashColor: TColors.popupColor.withAlpha((0.4 * 255).toInt()),
                highlightColor: TColors.popupColor.withAlpha((0.4 * 255).toInt()),
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(notificationsEnabled ? Ionicons.notifications : Ionicons.notifications_off, color: TColors.white),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: TSizes.spaceBtwSections),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                indicatorColor: isDarkTheme ? TColors.white : TColors.black,
                labelColor: isDarkTheme ? TColors.white : TColors.black,
                unselectedLabelColor: TColors.darkGrey,
                overlayColor: WidgetStateProperty.all(TColors.buttonDarkGrey.withAlpha((0.5 * 255).toInt())),
                tabs: [
                  Tab(text: S.of(context).chats),
                  Tab(text: S.of(context).controversy),
                  Tab(text: S.of(context).archive),
                ],
              ),
              ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: const Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ChatsTab(),
                      DisputesChatsTab(),
                      ArchiveChatsTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
