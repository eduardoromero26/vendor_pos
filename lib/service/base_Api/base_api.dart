import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vendor_pos/utils/constants.dart';
import 'dart:convert' as json;
import '../../main.dart';

mixin BaseApi {
  Future<http.Response> executeHttpRequest({
    required String urlMethod,
    String method = HttpMethod.GET,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    var uri = Uri.parse(env!['WORDPRESS_URL'] as String);
    uri = uri.replace(path: '$urlMethod', queryParameters: queryParameters);
    String username = Constants.username;
    String password = Constants.password;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    switch (method) {
      case HttpMethod.DELETE:
        return http.delete(
          uri,
          headers: _getHeader(basicAuth),
        );
      case HttpMethod.POST:
        return http.post(
          uri,
          body: body == null ? null : json.jsonEncode(body),
          headers: _getHeader(basicAuth),
        );
      case HttpMethod.PUT:
        return http.put(
          uri,
          body: body == null ? null : json.jsonEncode(body),
          headers: _getHeader(basicAuth),
        );
      default:
        return http.get(
          uri,
          headers: _getHeader(basicAuth),
        );
    }
  }

  Map<String, String> _getHeader(String basicAuth) {
    return {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': basicAuth
    };
  }
}

class HttpMethod {
  static const String PUT = 'PUT';
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
}
