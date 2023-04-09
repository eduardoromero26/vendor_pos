import 'package:vendor_pos/models/products_model.dart';

class CartItemModel {
  final ProductsModel product;
  int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });
  CartItemModel copyWith({
    ProductsModel? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
