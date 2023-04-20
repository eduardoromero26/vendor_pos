import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vendor_pos/models/category_model.dart';

import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/service/base_Api/base_api.dart';

class ProductService with BaseApi {
  Future<List<ProductsModel>> getProducts(
      {int perPage = 25, int page = 1, String? searchQuery}) async {
    Map<String, String> queryParameters = {
      'per_page': perPage.toString(),
      'page': page.toString(),
    };

    if (searchQuery != null && searchQuery.isNotEmpty) {
      queryParameters['search'] = searchQuery;
    }

    http.Response response = await executeHttpRequest(
      urlMethod: 'wp-json/wc/v3/products',
      queryParameters: queryParameters,
    );

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((product) => ProductsModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductsModel>> searchProducts({required String query}) async {
    List<ProductsModel> allProducts = []; // Lista de todos los productos
    List<ProductsModel> filteredProducts = allProducts.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return filteredProducts;
  }

  Future<List<ProductsModel>> getProductsByCategory({
    required int categoryId,
    int perPage = 25,
  }) async {
    http.Response response = await executeHttpRequest(
      urlMethod: 'wp-json/wc/v3/products',
      queryParameters: {
        'per_page': perPage.toString(),
        'category': categoryId.toString(),
      },
    );

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((product) => ProductsModel.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
