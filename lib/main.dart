import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_pos/providers/auth/products_provider.dart';
import 'package:vendor_pos/screens/auth/login/login_screen.dart';
import 'package:vendor_pos/utils/env.dart';
import 'package:vendor_pos/widgets/layout/main_layout.dart';

Map<String, String>? env;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  env = await loadEnvFile('assets/env/.env');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vendor - POS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MainLayout(),
          '/loginScreen': (context) => LoginScreen(),
        });
  }
}
