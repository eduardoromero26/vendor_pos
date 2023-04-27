import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vendor_pos/main.dart';

class LoginService {
  Future<bool> loginUserService(String username, String password) async {
    final _storage = FlutterSecureStorage();

    var uri = Uri.parse(env!['WORDPRESS_URL'] as String);
    var endpoint = uri.replace(path: '/wp-json/jwt-auth/v1/token');

    try {
      final response = await http.post(
        endpoint,
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
        },
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody.containsKey('token')) {
          String token = responseBody['token'];
          await _storage.write(key: 'token', value: token);
          return true;
        } else {
          return false;
        }
      } else {
        var errorJson = jsonDecode(response.body);
        var errorMessage = errorJson['message'];
        print(errorMessage ?? 'An unknown error occurred.');
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
