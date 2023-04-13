import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/providers/cart_provider.dart';
import 'package:vendor_pos/providers/products_provider.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/organism/products_grid/products_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    final List<ProductsModel> _products = productsProvider.products;
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    return productsProvider.isLoading
        ? const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(
                color: ColorTheme.primaryColor,
              ),
            ),
          )
        : ProductsGrid(
            productsData: _products,
            onAddToCart: cartProvider.addToCart,
          );
  }
}
