import 'dart:developer';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/app_bar/chat_app_bar.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/widgets/inputs/chat_input_field.dart';
import 'package:flutter/material.dart';

class MessageChatScreen extends StatefulWidget {
  final String username;
  final String message;
  final Widget icon;
  final double appBarHeight;
  final bool showAdditionalIcon;
  final bool showNotificationIcon;
  final bool isFromSupportChatItem;

  const MessageChatScreen({
    super.key,
    required this.username,
    required this.message,
    required this.icon,
    required this.showNotificationIcon,
    required this.appBarHeight,
    this.showAdditionalIcon = false,
    this.isFromSupportChatItem = false,
  });

  @override
  State<MessageChatScreen> createState() => _MessageChatScreenState();
}

class _MessageChatScreenState extends State<MessageChatScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final message = _controller.text;
    log("Отправлено сообщение: $message");
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        username: widget.username,
        message: widget.message,
        icon: widget.icon,
        showAdditionalIcon: widget.showAdditionalIcon,
        appBarHeight: widget.appBarHeight,
        showNotificationIcon: widget.showNotificationIcon,
        isFromSupportChatItem: widget.isFromSupportChatItem,
      ),
      body: Column(
        children: [
          Expanded(
            child: const Center(
              child: Text("Чат с поддержкой"),
            ),
          ),
          ChatInputField(
            controller: _controller,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
