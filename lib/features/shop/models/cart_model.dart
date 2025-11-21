import 'cart_item_model.dart';

class CartModel {
  final String cartId;
  final List<CartItemModel> items;

  CartModel({
    required this.cartId,
    required this.items,
  });
}
