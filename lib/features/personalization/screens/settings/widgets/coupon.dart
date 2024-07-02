import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'second_tab_content.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  CouponScreenState createState() => CouponScreenState();
}

class CouponScreenState extends State<CouponScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          S.of(context).titleCoupons,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).subtitleCouponsOrder,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.transparent),
                ),
              ),
              child: Row(
                children: [
                  _buildTab(S.of(context).activeCoupons, 0),
                  _buildTab(S.of(context).overdueCoupons, 1),
                ],
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SecondTabContent(),
                  _buildTabContent(S.of(context).noCoupons),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _tabController.index == index;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.animateTo(index);
        });
      },
      child: Container(
        width: 136,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: isSelected
            ? Border.all(color: isDarkTheme ? Colors.white : Colors.black)
            : const Border(),
          color: Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
              ? (isDarkTheme ? Colors.white : Colors.black)
              : (isDarkTheme ? Colors.grey[400] : TColors.darkerGrey),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String content) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
