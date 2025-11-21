import 'package:flutter/material.dart';
import '../../../../../../generated/l10n/l10n.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';

class ArchiveChatsTab extends StatefulWidget {
  const ArchiveChatsTab({super.key});

  @override
  State<ArchiveChatsTab> createState() => _ArchiveChatsTabState();
}

class _ArchiveChatsTabState extends State<ArchiveChatsTab> {
  final List<Map<String, String>> archiveChats = [];
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
          ? Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(TColors.primary)),
                const SizedBox(height: 16),
                Text(S.of(context).archiveHaveUpdated, style: TextStyle(fontSize: TSizes.fontSizeMd), textAlign: TextAlign.center),
              ],
            ),
          )
        : archiveChats.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(S.of(context).noChatsArchiveYet, style: TextStyle(fontSize: TSizes.fontSizeBg, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text(S.of(context).addChatArchiveAppear, style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.grey)),
                  ],
                ),
              ),
            )
          : ListView.builder(
            itemCount: archiveChats.length,
            itemBuilder: (context, index) {
              var chat = archiveChats[index];
              return ListTile(
                title: Text(chat['username']!),
                subtitle: Text(chat['message']!),
                trailing: Text(chat['time']!),
              );
            },
          ),
      ),
    );
  }
}
