import 'package:flutter/material.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../models/category_model.dart';

class BannerWidget extends StatelessWidget {
  final String categoryName;
  final List<CategoryModel> allCategories;

  const BannerWidget({
    super.key,
    required this.categoryName,
    required this.allCategories,
  });

  @override
  Widget build(BuildContext context) {
    String bannerImageUrl;

    CategoryModel? category = allCategories.firstWhere((cat) => cat.name == categoryName,
      orElse: () => CategoryModel(id: '', image: '', name: '', isFeatured: false),
    );

    if (category.name.isNotEmpty) {
      switch (category.name) {
        case 'Электроника':
          bannerImageUrl = TImages.banner1;
          break;
        case 'Мебель':
          bannerImageUrl = TImages.banner3;
          break;
        case 'Одежда':
          bannerImageUrl = TImages.banner7;
          break;
        case 'Обувь':
          bannerImageUrl = TImages.banner9;
          break;
        case 'Косметика':
          bannerImageUrl = TImages.banner3;
          break;
        case 'Украшения':
          bannerImageUrl = TImages.banner3;
          break;
        default:
          bannerImageUrl = TImages.banner3;
      }
    } else {
      bannerImageUrl = TImages.banner3;
    }

    return TRoundedImage(
      width: double.infinity,
      imageUrl: bannerImageUrl,
      applyImageRadius: true,
    );
  }
}
