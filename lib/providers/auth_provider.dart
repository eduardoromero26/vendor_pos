import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vendor_pos/service/login_service.dart';

class AuthProvider with ChangeNotifier {
  LoginService _loginService = LoginService();
  final _storage = FlutterSecureStorage();

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> checkLoginStatus() async {
    String? loggedIn = await _storage.read(key: 'isLoggedIn');
    _isLoggedIn = loggedIn == 'true';
    notifyListeners();
  }

  Future<bool> login(
      BuildContext context, String username, String password) async {
    try {
      final result = await _loginService.loginUserService(username, password);
      if (result) {
        _isLoggedIn = true;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful'),
          ),
        );
        await _storage.write(key: 'isLoggedIn', value: 'true');
        Navigator.pushNamed(context, '/');
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid username or password'),
          ),
        );
      }
      return result;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      return false;
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    await _storage.delete(key: 'isLoggedIn');
    notifyListeners();
  }
}
