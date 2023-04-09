import 'package:flutter/material.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/service/product_service.dart';

class ProductsProvider extends ChangeNotifier {
  final List<ProductsModel> _products = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMoreProducts = true;
  List<ProductsModel> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasMoreProducts => _hasMoreProducts;

  Future<void> fetchProducts({int perPage = 25}) async {
    if (_isLoading || !_hasMoreProducts) return;
    _isLoading = true;
    try {
      final fetchedProducts =
          await ProductService().getProducts(perPage: perPage, page: _page);

      if (fetchedProducts.isEmpty) {
        _hasMoreProducts = false;
      } else {
        _products.addAll(fetchedProducts);
        _page++;
      }
    } catch (error) {
      throw Exception('Failed to fetch products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
