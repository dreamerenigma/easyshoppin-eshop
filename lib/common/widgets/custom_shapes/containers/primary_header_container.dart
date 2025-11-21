import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.backgroundColor = TColors.youngNight,
  });

  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: backgroundColor,
        /// -- If [size.isFinite': is not true] Error -> Read README.md file at [DESIGN ERRORS] # 1
        child: Stack(
          children: [
            /// -- Background Custom Shapes
            Positioned(top: -150, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite.withAlpha((0.1 * 255).toInt()))),
            Positioned(top: 100, right: -300, child: TCircularContainer(backgroundColor: TColors.textWhite.withAlpha((0.1 * 255).toInt()))),
            child,
          ],
        ),
      ),
    );
  }
}
