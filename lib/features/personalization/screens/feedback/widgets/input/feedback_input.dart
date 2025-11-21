import 'package:flutter/material.dart';

class FeedbackInput extends StatelessWidget {
  const FeedbackInput({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      maxLines: 1,
    );
  }
}
