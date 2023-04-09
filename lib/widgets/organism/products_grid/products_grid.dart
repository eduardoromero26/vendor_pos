import 'package:flutter/material.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/widgets/molecules/card/card.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductsModel> productsData;

  const ProductsGrid({
    key,
    required this.productsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 0;
    double cardWidth = screenWidth / crossAxisCount;

    if (screenWidth < 800) {
      crossAxisCount = 2;
    } else if (screenWidth < 1150) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }
    cardWidth = screenWidth / crossAxisCount;

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Flexible(
            child: CardWidget(
              title: productsData[index].name, // Título del producto
              subTitle: productsData[index]
                  .categories[0]
                  .name
                  .name, // Subtítulo del producto
              imageUrl: productsData[index].images[0].src, // URL de la imagen
              price: double.parse(productsData[index].price),
              onAddToCart: () {},
            ),
          );
        },
        childCount: productsData.length,
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
