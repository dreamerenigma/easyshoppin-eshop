import 'package:flutter/material.dart';
import '../../../../../../generated/l10n/l10n.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../lists/sellers_chat_list.dart';
import '../lists/support_chat_list.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({super.key});

  @override
  ChatsTabState createState() => ChatsTabState();
}

class ChatsTabState extends State<ChatsTab> {
  bool isLoading = true;

  Future<void> loadChats() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(TColors.primary)),
                  const SizedBox(height: 16),
                  Text(S.of(context).chatsHaveUpdated, style: TextStyle(fontSize: TSizes.fontSizeMd), textAlign: TextAlign.center),
                ],
              ),
            )
          : ListView(
              children: [
                const SupportChatList(),
                const SellersChatList(),
              ],
            ),
      ),
    );
  }
}
