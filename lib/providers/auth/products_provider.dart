import 'package:flutter/material.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/service/product_service.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductsModel> _products = [];

  List<ProductsModel> get products => _products;

  Future<List<ProductsModel>> fetchProducts({int perPage = 100}) async {
    try {
      final fetchedProducts =
          await ProductService.getProducts(perPage: perPage);
      _products = fetchedProducts;
      notifyListeners();
      return _products;
    } catch (error) {
      throw Exception('Failed to fetch products: $error');
    }
  }
}
