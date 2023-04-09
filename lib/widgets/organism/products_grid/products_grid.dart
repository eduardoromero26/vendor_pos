import 'package:flutter/material.dart';
import 'package:vendor_pos/models/cart_model.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/widgets/molecules/card/card.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductsModel> productsData;
  void Function(CartItemModel) onAddToCart;
  ProductsGrid({
    key,
    required this.productsData,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    double childAspectRatio = 1.2;
    double cardWidth = screenWidth / crossAxisCount;

    if (screenWidth < 500) {
      crossAxisCount = 2;
      childAspectRatio = .7;
    } else if (screenWidth < 700) {
      crossAxisCount = 2;
      childAspectRatio = 1;
    } else if (screenWidth < 900) {
      crossAxisCount = 2;
      childAspectRatio = 1.1;
    } else if (screenWidth < 1100) {
      crossAxisCount = 3;
      childAspectRatio = .8;
    } else if (screenWidth < 1250) {
      crossAxisCount = 3;
      childAspectRatio = 1;
    } else if (screenWidth < 1500) {
      crossAxisCount = 4;
      childAspectRatio = .8;
    } else {
      crossAxisCount = 4;
      childAspectRatio = 1.1;
    }
    cardWidth = screenWidth / crossAxisCount;

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return CardWidget(
            product: productsData[index],
            onAddToCart: onAddToCart,
          );
        },
        childCount: productsData.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }
}
