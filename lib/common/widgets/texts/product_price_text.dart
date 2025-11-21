import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';

class TProductPriceText extends StatelessWidget {
  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  const TProductPriceText({
    super.key,
    this.currencySign = ' ₽',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  String formatNumberWithSpaces(String number) {
    final regExp = RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))');
    return number.replaceAllMapped(regExp, (match) => ' ');
  }

  @override
  Widget build(BuildContext context) {
    final double parsedPrice = double.tryParse(price) ?? 0.0;
    final int roundedPrice = parsedPrice.toInt();
    final formattedPrice = formatNumberWithSpaces(roundedPrice.toString());

    return Text(
      '$formattedPrice$currencySign',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
        ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
        : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null, color: TColors.red),
    );
  }
}
