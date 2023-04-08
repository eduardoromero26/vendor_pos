import 'package:flutter/material.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/widgets/molecules/card/card.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductsModel> products;
  const ProductsGrid({
    key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 3;
    double cardWidth = screenWidth / crossAxisCount;

    if (screenWidth < 600) {
      crossAxisCount = 2;
      cardWidth = screenWidth / crossAxisCount;
    } else if (screenWidth > 1100) {
      crossAxisCount = 4;
      cardWidth = screenWidth / crossAxisCount;
    }

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return CardWidget(
            title: products[index].name, // Título del producto
            subTitle: products[index]
                .categories[0]
                .name
                .name, // Subtítulo del producto
            imageUrl: products[index].images[0].src, // URL de la imagen
            price: double.parse(products[index].price),
            onAddToCart: () {},
          );
        },
        childCount: products.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.2, // Ajustar el valor de childAspectRatio
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }
}
