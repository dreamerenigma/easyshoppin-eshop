import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/app_colors.dart';

class PointsInfoScreen extends StatefulWidget {
  const PointsInfoScreen({super.key});

  @override
  State<PointsInfoScreen> createState() => _PointsInfoScreenState();
}

class _PointsInfoScreenState extends State<PointsInfoScreen> {
  Future<void> _reloadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(showBackArrow: true),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: _reloadData,
          displacement: 30,
          color: TColors.primary,
          backgroundColor: TColors.buttonDarkGrey,
          child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}
