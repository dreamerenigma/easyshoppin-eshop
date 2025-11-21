import 'package:easyshoppin_eshop/features/personalization/controllers/load_data_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

void loadDataSalesDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.center,
          child: Material(
            color: TColors.transparent,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: THelperFunctions.isDarkMode(context) ? TColors.youngNight : TColors.light,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: const EdgeInsets.all(TSizes.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).loadSaleData,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    S.of(context).uploadSaleDatabase,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: TColors.darkerGrey, width: 2),
                          ),
                          child: Text(S.of(context).cancel),
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await LoadDataController.uploadSales(context);
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColors.primary,
                            side: const BorderSide(color: TColors.primary),
                          ),
                          child: Text(S.of(context).upload),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
