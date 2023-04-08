import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/utils/constants.dart';

class ProductService {
  static Future<dynamic> getProducts({int perPage = 100}) async {
    const String baseUrl =
        'https://minervajewelrymx.com/wp-json/wc/v3/products';

    final response = await http.get(
      Uri.parse('$baseUrl?per_page=100'),
      headers: {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('${Constants.username}:${Constants.password}'))}',
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
