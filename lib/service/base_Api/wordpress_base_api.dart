import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

mixin WordpressBaseApi {
  final _storage = FlutterSecureStorage();

  Future<http.Response> executeHttpRequest({
    required String urlMethod,
    String method = HttpMethod.GET,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    http.MultipartRequest? customRequest,
  }) async {
    var uri = Uri.parse(env!['WORDPRESS_URL'] as String);
    uri = uri.replace(path: '$urlMethod', queryParameters: queryParameters);
    String? token = await _storage.read(key: 'token');

    // Actualiza el encabezado de acuerdo a la solicitud personalizada
    Map<String, String> headers = _getHeader(token!);
    if (customRequest != null) {
      headers['Content-Type'] = 'multipart/form-data';
    }

    // Usa la solicitud personalizada si está presente, de lo contrario, usa el método proporcionado
    if (customRequest != null) {
      customRequest.headers.addAll(headers);
      final streamedResponse = await customRequest.send();
      return http.Response.fromStream(streamedResponse);
    } else {
      switch (method) {
        case HttpMethod.DELETE:
          return http.delete(
            uri,
            headers: headers,
          );
        case HttpMethod.POST:
          return http.post(
            uri,
            body: body == null ? null : jsonEncode(body),
            headers: headers,
          );
        case HttpMethod.PUT:
          return http.put(
            uri,
            body: body == null ? null : jsonEncode(body),
            headers: headers,
          );
        default:
          return http.get(
            uri,
            headers: headers,
          );
      }
    }
  }

  Map<String, String> _getHeader(String token) {
    return {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
}

class HttpMethod {
  static const String PUT = 'PUT';
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
}
