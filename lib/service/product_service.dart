import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/service/base_Api/base_api.dart';

class ProductService with BaseApi {
  Future<List<ProductsModel>> getProducts(
      {int perPage = 25, int page = 1}) async {
    http.Response response = await executeHttpRequest(
      urlMethod: 'wp-json/wc/v3/products',
      queryParameters: {
        'per_page': perPage.toString(),
        'page': page.toString(),
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
