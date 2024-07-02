import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easyshoppin_eshop/data/repositories/brands/brand_repository.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../data/dummy_data.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';

class UploadRelationshipsBrands extends StatelessWidget {
  const UploadRelationshipsBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).uploadBrandCategories,
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
        ),
        showBackArrow: true,
        backArrowColor: TColors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              final brandCategories = TDummyData.brandCategory;
              await BrandRepository.instance.uploadBrandCategories(brandCategories);
              Get.snackbar('Success', 'Brand categories uploaded successfully');
            } catch (e) {
              Get.snackbar('Error', 'Failed to upload brand categories: $e');
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
          child: const Text('Upload Brand Categories'),
        ),
      ),
    );
  }
}
