import 'package:flutter/material.dart';
import '../items/sellers_chat_item.dart';

class SellersChatList extends StatelessWidget {
  const SellersChatList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> sellersChats = [
      {"username": "TechStore", "message": "Ваш заказ отправлен 🚚", "time": "10:30"},
      {"username": "FashionHub", "message": "У нас новая коллекция!", "time": "09:15"},
      {"username": "GadgetWorld", "message": "Мы обновили цены 📱", "time": "Вчера"},
      {"username": "HomeDecor", "message": "Скидка 20% на мебель!", "time": "Пн"},
    ];

    return Column(
      children: List.generate(sellersChats.length, (index) {
        final chat = sellersChats[index];
        return SellersChatItem(
          username: chat["username"]!,
          message: chat["message"]!,
          time: chat["time"]!,
          isLastItem: index == sellersChats.length - 1,
        );
      }),
    );
  }
}

