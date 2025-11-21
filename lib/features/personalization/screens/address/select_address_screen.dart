import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/courier_page.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/pickup_point_page.dart';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/utils/constants/app_images.dart';

import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  SelectAddressScreenState createState() => SelectAddressScreenState();
}

class SelectAddressScreenState extends State<SelectAddressScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(S.of(context).selectDelivery, style: TextStyle(fontSize: TSizes.fontSizeXl)),
          backArrowColor: Theme.of(context).iconTheme.color,
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                CustomTab(
                  icon: TImages.deliveryLocation,
                  text: S.of(context).pickUpPoint,
                  isSelected: _selectedIndex == 0,
                ),
                CustomTab(
                  icon: TImages.courier,
                  text: S.of(context).courier,
                  isSelected: _selectedIndex == 1,
                ),
              ],
              labelColor: TColors.blue,
              unselectedLabelColor: TColors.grey,
              indicatorColor: TColors.blue,
              overlayColor: WidgetStateProperty.all(TColors.buttonDarkGrey.withAlpha((0.5 * 255).toInt())),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  PickupPointPage(),
                  CourierPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String icon;
  final String text;
  final bool isSelected;

  const CustomTab({super.key, required this.icon, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    Color iconColor = isSelected ? TColors.blue : TColors.grey;
    Color textColor = isSelected ? TColors.blue : TColors.grey;

    return Tab(
      icon: Image.asset(icon, height: 24.0, color: iconColor),
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
