import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/popups/loaders.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  ChatsScreenState createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    void toggleNotifications() {
      setState(() {
        notificationsEnabled = !notificationsEnabled;
      });

      String message = notificationsEnabled
          ? S.of(context).chatNotificationEnabled
          : S.of(context).chatNotificationDisabled;

      TLoaders.customToast(message: message);
    }

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).chats,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: TColors.grey,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                const Icon(Ionicons.chatbox, size: 20, color: Colors.black),
                const SizedBox(width: 6.0),
                GestureDetector(
                  onTap: toggleNotifications,
                  child: Text(
                    S.of(context).readAll,
                    style: const TextStyle(fontSize: TSizes.fontSizeSm, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: TColors.grey,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: GestureDetector(
              onTap: toggleNotifications,
              child: Icon(
                notificationsEnabled ? Ionicons.notifications : Ionicons.notifications_off,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: TSizes.spaceBtwSections),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                indicatorColor: isDarkTheme ? Colors.white : Colors.black,
                labelColor: isDarkTheme ? Colors.white : Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: S.of(context).chats),
                  Tab(text: S.of(context).controversy),
                  Tab(text: S.of(context).archive),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('Содержимое вкладки "Чаты"')),
                    Center(child: Text('Содержимое вкладки "Споры"')),
                    Center(child: Text('Содержимое вкладки "Архив"')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
