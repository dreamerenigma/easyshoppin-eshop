import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';

class ChatInputField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  bool isEmojiIconVisible = true;

  void _onTextChanged() {
    setState(() {
      isEmojiIconVisible = widget.controller.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextSelectionTheme(
              data: TextSelectionThemeData(
                cursorColor: TColors.blue,
                selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                selectionHandleColor: TColors.blue,
              ),
              child: TextField(
                controller: widget.controller,
                focusNode: FocusNode()..addListener(() {
                  setState(() {
                    isEmojiIconVisible = widget.controller.text.isNotEmpty;
                  });
                }),
                onChanged: (text) {
                  _onTextChanged();
                },
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "Введите сообщение",
                  hintStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeMd),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  filled: true,
                  fillColor: TColors.lightGrey.withAlpha((0.2 * 255).toInt()),
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusXl),
                    borderSide: BorderSide(color: TColors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusXl),
                    borderSide: BorderSide(color: TColors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusXl),
                    borderSide: BorderSide(color: TColors.transparent),
                  ),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.attach_file, size: 26),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isEmojiIconVisible = !isEmojiIconVisible;
                            });
                          },
                          child: Icon(
                            isEmojiIconVisible ? Icons.emoji_emotions_outlined : Icons.keyboard,
                            size: 28,
                          ),
                        ),
                        if (widget.controller.text.isNotEmpty)
                          SizedBox(width: 6),
                        if (widget.controller.text.isNotEmpty)
                          InkWell(
                            onTap: () {
                              widget.controller.clear();
                              FocusScope.of(context).unfocus();
                            },
                            child: const Icon(Icons.close, size: 18),
                          ),
                      ],
                    ),
                  ),
                ),
                style: TextStyle(fontSize: TSizes.fontSizeLg),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: widget.onSend,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.send, color: TColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
