import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:easyshoppin_eshop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../utils/widgets/no_glow_scroll_behavior.dart';
import '../../controllers/all_products_controller.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      /// AppBar
      appBar: TAppBar(title: Text(title, style: TextStyle(fontSize: TSizes.fontSizeXl)), showBackArrow: true),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, context: context);

                if (widget != null) return widget;
                final products = snapshot.data!;

                return TSortableProducts(products: products);
              },
            ),
          ),
        ),
      ),
    );
  }
}
