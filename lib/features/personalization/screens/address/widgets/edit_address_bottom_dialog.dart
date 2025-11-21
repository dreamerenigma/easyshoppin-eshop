import 'package:flutter/material.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

void editAddressBottomDialog(BuildContext context) {
  final dark = THelperFunctions.isDarkMode(context);

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: TSizes.bg, right: TSizes.bg, bottom: TSizes.bg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                foregroundColor: dark ? TColors.white.withAlpha((0.5 * 255).toInt()) : TColors.dark.withAlpha((0.5 * 255).toInt()),
                backgroundColor: TColors.grey.withAlpha((0.2 * 255).toInt()),
                side: BorderSide.none,
              ),
              child: Text('Изменить'),
            ),
            const SizedBox(height: TSizes.sm),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                foregroundColor: dark ? TColors.red.withAlpha((0.5 * 255).toInt()) : TColors.dark.withAlpha((0.5 * 255).toInt()),
                backgroundColor: TColors.red.withAlpha((0.2 * 255).toInt()),
                side: BorderSide.none,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete_outline_rounded, color: TColors.red, size: 26),
                  const SizedBox(width: 8),
                  Text('Удалить', style: TextStyle(color: TColors.red)),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
