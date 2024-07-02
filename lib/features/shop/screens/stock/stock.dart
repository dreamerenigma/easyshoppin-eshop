import 'package:flutter/material.dart';
import 'package:easyshoppin_eshop/common/widgets/appbar/appbar.dart';
import 'package:easyshoppin_eshop/common/widgets/layouts/grid_layout.dart';
import 'package:easyshoppin_eshop/features/shop/models/product_model.dart';
import 'package:easyshoppin_eshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:easyshoppin_eshop/utils/constants/sizes.dart';

import '../../../../generated/l10n/l10n.dart';
import '../../controllers/product/product_controller.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(S.of(context).stock, style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: controller.fetchProductsWithStockStatus(), // Updated to fetch products with stock status
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(S.of(context).noProductsStock));
          } else {
            List<ProductModel> products = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
