import 'package:easyshoppin_eshop/data/repositories/categories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';

class UploadRelationshipsProduct extends StatelessWidget {
  const UploadRelationshipsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(S.of(context).btnUploadProductsCategories, style: TextStyle(fontSize: TSizes.fontSizeXl, color: TColors.white)),
        showBackArrow: true,
        backArrowColor: TColors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final productCategories = TDummyData.productCategories;
              await CategoryRepository.instance.uploadProductCategoryDummyData(productCategories);
              Get.snackbar(S.of(context).success, S.of(context).productCategoriesUploadedSuccess);
            } catch (e) {
              Get.snackbar(S.of(context).error, '${S.of(context).failedUploadProductCategories}: $e');
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
          child: Text(S.of(context).btnUploadProductsCategories),
        ),
      ),
    );
  }
}
