import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../../../../../authentication/widgets/lists/country_list.dart';

class _CurrencyOverlayPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(12),
      color: context.isDarkMode ? TColors.dark : TColors.white,
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Валюта", style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SizedBox(width: 28, child: SvgPicture.asset(country.flag)),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 50,
                          child: Text(country.alphaCode, style: const TextStyle(fontSize: 13)),
                        ),
                        Expanded(
                          child: Text("${country.currencyCode}  ${country.currencyName}", style: const TextStyle(fontSize: TSizes.fontSizeMd)),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OverlayEntry? currencyOverlay;

void showCurrencyOverlay(BuildContext context, RenderBox targetBox) {
  final overlay = Overlay.of(context);
  final position = targetBox.localToGlobal(Offset.zero);
  final size = targetBox.size;

  currencyOverlay = OverlayEntry(
    builder: (context) {
      return Positioned(
        left: position.dx - 205,
        top: position.dy + size.height - 29,
        child: _CurrencyOverlayPanel(),
      );
    },
  );

  overlay.insert(currencyOverlay!);
}

void removeCurrencyOverlay() {
  currencyOverlay?.remove();
  currencyOverlay = null;
}
