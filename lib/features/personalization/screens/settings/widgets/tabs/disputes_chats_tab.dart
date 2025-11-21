import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../generated/l10n/l10n.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';

class DisputesChatsTab extends StatefulWidget {
  const DisputesChatsTab({super.key});

  @override
  State<DisputesChatsTab> createState() => _DisputesChatsTabState();
}

class _DisputesChatsTabState extends State<DisputesChatsTab> {
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
      body: isLoading
        ? Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(TColors.primary)),
                const SizedBox(height: 16),
                Text(S.of(context).disputesHaveRenewed, style: TextStyle(fontSize: TSizes.fontSizeMd), textAlign: TextAlign.center),
              ],
            ),
          ),
        )
      : archiveChats.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).noOpenDisputes, style: TextStyle(fontSize: TSizes.fontSizeBg, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(text: S.of(context).createDisputeGoTo, style: TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.grey)),
                        TextSpan(
                          text: S.of(context).chatWithSupport,
                          style: const TextStyle(fontSize: TSizes.fontSizeSm, color: TColors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pushNamed(context, '/supportChat');
                          },
                        ),
                      ],
                    ),
                  ),
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
    );
  }
}
