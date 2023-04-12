import 'dart:convert';
import 'package:vendor_pos/service/base_Api/base_api.dart';

import 'package:vendor_pos/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoriesService with BaseApi {
  Future<List<CategoryModel>> getCategories() async {
    http.Response response = await executeHttpRequest(
      urlMethod: 'wp-json/wc/v3/products/categories',
    );

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
