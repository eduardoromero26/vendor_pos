import 'package:flutter/material.dart';
import 'package:vendor_pos/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  void addToCart(CartItemModel item) {
    int index =
        _items.indexWhere((element) => element.product.id == item.product.id);
    if (index == -1) {
      _items.add(item);
    } else {
      _items[index] =
          _items[index].copyWith(quantity: _items[index].quantity + 1);
    }
    notifyListeners();
  }

  void incrementQuantity(CartItemModel item) {
    int index =
        _items.indexWhere((element) => element.product.id == item.product.id);
    if (index != -1) {
      _items[index] =
          _items[index].copyWith(quantity: _items[index].quantity + 1);
      notifyListeners();
    }
  }

  void decrementQuantity(CartItemModel item) {
    int index =
        _items.indexWhere((element) => element.product.id == item.product.id);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index] =
            _items[index].copyWith(quantity: _items[index].quantity - 1);
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void checkout() {}

  double get totalPrice {
    return _items.fold(
        0,
        (sum, item) =>
            sum + (double.parse(item.product.price) * item.quantity));
  }
}
