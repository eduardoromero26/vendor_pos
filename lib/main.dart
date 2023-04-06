import 'package:vendor_pos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_pos/screens/auth/login/login_screen.dart';
import 'package:vendor_pos/screens/products/add_new_product.dart';
import 'package:vendor_pos/widgets/layout/main_layout.dart';
import 'providers/auth/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
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
        initialRoute: '/loginScreen',
        routes: {
          '/': (context) => MainLayout(),
          '/loginScreen': (context) => LoginScreen(),
          '/addNewProduct': (context) => AddNewProduct(),
        });
  }
}
