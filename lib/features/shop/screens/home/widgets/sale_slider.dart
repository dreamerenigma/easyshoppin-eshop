import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../common/widgets/shimmers/grid_shimmer.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../controllers/sale_controller.dart';
import '../../sales/sales_screen.dart';

class TSaleSlider extends StatelessWidget {
  const TSaleSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SaleController());

    return Obx(
      () {
        if (controller.isLoading.value) {
          return const TGridShimmer(itemCount: 8, aspectRatio: 1.0);
        }

        if (controller.featuredSales.isEmpty) {
          return Center(
            child: Text(S.of(context).noDataFound, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
          );
        }

        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: controller.featuredSales.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final sale = controller.featuredSales[index];
                  return TVerticalImageText(
                    image: sale.imageUrl,
                    imageSize: 70,
                    title: sale.name,
                    isSquare: true,
                    onTap: () => Get.to(() => SalesScreen(sale: sale))
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
