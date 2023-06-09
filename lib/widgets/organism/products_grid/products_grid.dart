import 'package:flutter/material.dart';
import 'package:vendor_pos/models/cart_model.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/widgets/molecules/card/card.dart';

class ProductsGrid extends StatefulWidget {
  final List<ProductsModel> productsData;
  void Function(CartItemModel) onAddToCart;

  ProductsGrid({
    key,
    required this.productsData,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
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

    return SliverPadding(
      padding: const EdgeInsets.all(12.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return CardWidget(
              product: widget.productsData[index],
              onAddToCart: widget.onAddToCart,
            );
          },
          childCount: widget.productsData.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
      ),
    );
  }
}
