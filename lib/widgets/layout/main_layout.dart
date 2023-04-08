import 'package:flutter/material.dart';
import 'package:vendor_pos/providers/auth/products_provider.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/molecules/cart_item/cart_item.dart';
import 'package:vendor_pos/widgets/molecules/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:vendor_pos/widgets/organism/products_grid/products_grid.dart';
import 'package:vendor_pos/widgets/organism/shopping_cart/shopping_cart.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context).products;
    final List<CartItem> cartItems = [
      const CartItem(
        imageUrl:
            'https://minervajewelrymx.com/wp-content/uploads/2022/09/Curvy-Hoops-scaled.jpg',
        title: 'Curvy hoops',
        quantity: 2,
        price: 150.0,
      ),
      const CartItem(
        imageUrl:
            'https://minervajewelrymx.com/wp-content/uploads/2022/09/Sugar-Boo-collar--scaled.jpg',
        title: 'Sugar boo collar',
        quantity: 1,
        price: 250.0,
      ),
    ];
    final List<String> categories = [
      'Anillos',
      'Aretes',
      'Collares',
      'Pulseras',
      'Personalizados'
    ];
    final TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.backgroundColor,
        body: Row(
          children: [
            Expanded(
              child: CustomScrollView(slivers: <Widget>[
                CustomSliverAppBar(
                    searchController: searchController, categories: categories),
                const SliverToBoxAdapter(
                  child: Divider(),
                ),
                ProductsGrid(products: productsData),
              ]),
            ),
            SizedBox(
              width: 300,
              child: ShoppingCart(items: cartItems),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addNewProduct');
          },
          backgroundColor: ColorTheme.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
