import 'package:pizza_221/models/product.dart';


class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}