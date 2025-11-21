import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';

class ProductsBottomSheetDialog extends StatelessWidget {
  const ProductsBottomSheetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Выберите действие', style: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: TColors.buttonGrey),
                ),
              ],
            ),
          ),
          Divider(height: 0, thickness: 1, color: TColors.buttonDarkGrey),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                splashColor: TColors.darkerGrey.withAlpha((0.2 * 255).toInt()),
                highlightColor: TColors.darkerGrey.withAlpha((0.2 * 255).toInt()),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    'Скрыть товар',
                    style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                splashColor: TColors.darkerGrey.withAlpha((0.2 * 255).toInt()),
                highlightColor: TColors.darkerGrey.withAlpha((0.2 * 255).toInt()),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    'Показывать меньше похожих товаров',
                    style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
