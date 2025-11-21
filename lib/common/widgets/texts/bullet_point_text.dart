import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';

class LinkBulletPoint extends StatelessWidget {
  final String text;
  final String url;

  const LinkBulletPoint({super.key, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: const Icon(Icons.brightness_1, size: 8.0),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _openLink(context, url);
            },
            child: Text(
              text,
              style: TextStyle(
                color: TColors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _openLink(BuildContext context, String browser) {
    String url = '';
    switch (browser) {
      case 'Google Chrome':
        url = 'https://support.google.com/chrome/answer/95647?hl=ru';
        break;
      case 'Safari':
        url = 'https://support.apple.com/ru-ru/guide/safari/sfri4096/mac';
        break;
      case 'Яндекс Браузер':
        url = 'https://yandex.ru/support/browser/cookies.html';
        break;
      case 'Mozilla Firefox':
        url = 'https://support.mozilla.org/ru/kb/cookies-information-websites-store-on-your-computer';
        break;
      default:
        url = '';
        return;
    }
  }
}

Widget buildBulletPoint(String text) {
  String formattedText = text.replaceAll(' - ', '\n- ');

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 7),
        child: const Icon(Icons.brightness_1, size: 8.0),
      ),
      const SizedBox(width: 8.0),
      Expanded(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: _extractBoldPart(text),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: formattedText.substring(_extractBoldPart(formattedText).length),
              ),
            ],
          ),
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
      ),
    ],
  );
}

String _extractBoldPart(String text) {
  List<String> boldKeywords = [
    'Необходимые',
    'Функциональные',
    'Аналитические',
    'Маркетинговые',
  ];

  for (var keyword in boldKeywords) {
    final index = text.indexOf(keyword);
    if (index != -1) {
      return text.substring(0, index + keyword.length);
    }
  }

  return text;
}
