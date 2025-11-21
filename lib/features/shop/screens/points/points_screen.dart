import 'package:easyshoppin_eshop/features/shop/screens/points/points_info_screen.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../routes/custom_page_route.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Программа лояльности', style: const TextStyle(fontSize: TSizes.fontSizeXl)),
        actions: [
          Container(
            height: TSizes.spaceBtwSectionsExpanded,
            decoration: BoxDecoration(
              color: TColors.buttonSecondary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(right: 16),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, createPageRoute(PointsInfoScreen()));
                },
                child: Icon(
                  Icons.info_rounded,
                  color: TColors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
