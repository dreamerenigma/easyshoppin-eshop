import 'package:flutter/material.dart';
import '../items/support_chat_item.dart';

class SupportChatList extends StatelessWidget {
  const SupportChatList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> supportChats = [
      {'username': 'Поддержка Easy Shoppin', 'message': 'Помогаем и подсказываем', 'time': '10:30'},
      {'username': 'Скидки и акции', 'message': 'Делаем шопинг выгоднее', 'time': '09:15'},
      {'username': 'Сообщение от службы поддержки', 'message': 'Ваш заказ отправлен. Обратите внимание: продавец выбрал свой метод доставки, который может не отслеживаться', 'time': '08:50'},
    ];

    return Column(
      children: supportChats.map((chat) {
        return SupportChatItem(
          username: chat['username']!,
          message: chat['message']!,
          time: chat['time']!,
        );
      }).toList(),
    );
  }
}
