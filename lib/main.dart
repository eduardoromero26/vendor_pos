import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_pos/providers/auth_provider.dart';
import 'package:vendor_pos/providers/products_provider.dart';
import 'package:vendor_pos/screens/auth/login/login_screen.dart';
import 'package:vendor_pos/screens/home/home_screen.dart';
import 'package:vendor_pos/utils/env.dart';

import 'providers/cart_provider.dart';
import 'providers/categories_provider.dart';

Map<String, String>? env;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  env = await loadEnvFile('assets/env/.env');
  final authProvider = AuthProvider();
  await authProvider.checkLoginStatus();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductsProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => CategoriesProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      title: 'Vendor - POS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: authProvider.isLoggedIn ? const HomeScreen() : LoginScreen(),
    );
  }
}
