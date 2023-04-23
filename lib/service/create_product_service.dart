import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vendor_pos/service/base_Api/base_api.dart';

class CreateNewProductService with BaseApi {
  Future<Map<String, dynamic>> createNewProduct(
      Map<String, dynamic> productData) async {
    http.Response response = await executeHttpRequest(
      urlMethod: 'wp-json/wc/v3/products',
      method: HttpMethod.POST,
      body: productData,
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to create a new product. Status code: ${response.body}');
    }
  }
}
