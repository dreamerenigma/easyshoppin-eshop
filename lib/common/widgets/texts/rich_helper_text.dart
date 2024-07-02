import 'package:flutter/material.dart';

Widget buildRichTextSimple(BuildContext context, String leadingText, String contentText) {
  return RichText(
    text: TextSpan(
      text: leadingText,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      children: <TextSpan>[
        TextSpan(
          text: contentText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ),
  );
}

Widget buildRichTextWithBoldOption(BuildContext context, String leadingText, String contentText, {bool isBoldContent = false, double? fontSize}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        leadingText,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
        ),
      ),
      Expanded(
        child: RichText(
          text: TextSpan(
            text: isBoldContent ? contentText : null,
            style: TextStyle(
              fontWeight: isBoldContent ? FontWeight.bold : FontWeight.normal,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontSize: fontSize ?? Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
            children: isBoldContent ? null : <TextSpan>[
              TextSpan(
                text: contentText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}


