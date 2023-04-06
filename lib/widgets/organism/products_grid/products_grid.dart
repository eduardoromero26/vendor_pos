import 'package:flutter/material.dart';
import 'package:vendor_pos/widgets/molecules/card/card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.cardsData,
  });

  final List<Map<String, String>> cardsData;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;
    double cardWidth = screenWidth / crossAxisCount;

    if (screenWidth < 600) {
      crossAxisCount = 2;
      cardWidth = screenWidth / crossAxisCount;
    } else if (screenWidth < 960) {
      crossAxisCount = 3;
      cardWidth = screenWidth / crossAxisCount;
    }

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return CardWidget(
            title: cardsData[index]['title']!,
            subTitle: cardsData[index]['subTitle']!,
            imageUrl: cardsData[index]['imageUrl']!,
            price: 100.00,
            onAddToCart: () {},
          );
        },
        childCount: cardsData.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.8, // Ajustar el valor de childAspectRatio
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }
}
