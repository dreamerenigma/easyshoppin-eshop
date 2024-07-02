import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/courier_page.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/address/widgets/pickup_point_page.dart';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';

import '../../../../generated/l10n/l10n.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  SelectAddressScreenState createState() => SelectAddressScreenState();
}

class SelectAddressScreenState extends State<SelectAddressScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0; // Track selected tab index

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
          title: Text(S.of(context).selectDelivery),
          backArrowColor: Theme.of(context).iconTheme.color,
        ),
        body: Column(
          children: [
            // Custom Tab Bar
            TabBar(
              controller: _tabController,
              tabs: [
                CustomTab(
                  icon: TImages.deliveryLocation,
                  text: S.of(context).pickUpPoint,
                  isSelected: _selectedIndex == 0,
                ),
                CustomTab(
                  icon: TImages.courier, // Your courier icon asset
                  text: S.of(context).courier,
                  isSelected: _selectedIndex == 1,
                ),
              ],
              labelColor: Colors.blue, // Set the label color to blue
              unselectedLabelColor: Colors.grey, // Set the unselected label color to grey
              indicatorColor: Colors.blue, // Set the indicator color to blue
            ),
            // Tab Bar Views
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(), // Disable page scrolling effect
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
    return Tab(
      icon: Image.asset(
        icon,
        height: 24.0, // Adjust the size of the icon here
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      child: Text(text),
    );
  }
}
