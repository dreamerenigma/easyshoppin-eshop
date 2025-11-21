import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/features/shop/screens/order/widgets/order_list.dart';
import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class FavoriteStoresScreen extends StatefulWidget {
  const FavoriteStoresScreen({super.key});

  @override
  State<FavoriteStoresScreen> createState() => _FavoriteStoresScreenState();
}

class _FavoriteStoresScreenState extends State<FavoriteStoresScreen> {

  Future<void> _reloadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(title: Text(S.of(context).favoriteStores, style: const TextStyle(fontSize: TSizes.fontSizeXl)), showBackArrow: true),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: _reloadData,
          displacement: 5,
          color: TColors.primary,
          backgroundColor: TColors.buttonDarkGrey,
          child: Column(
            children: [
              /// -- TSearchContainer directly under AppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItemsSmall),
                child: TSearchContainer(
                  showBorder: true,
                  showBackground: false,
                  showPrefixIcon: false,
                  suffixIconSearchOnly: true,
                  padding: EdgeInsets.zero,
                  searchText: S.of(context).findStore,
                  shouldNavigate: false,
                  onChanged: (text) {},
                ),
              ),
              /// -- Centered content under TSearchContainer
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    /// -- Orders
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: const [
                        TOrderListItems(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
