import 'package:flutter/material.dart';
import 'package:vendor_pos/widgets/organism/products_grid/products_grid.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> cardsData = [
    {
      'title': 'Casa de playa',
      'subTitle':
          'Casa entera · 4 huéspedes · 2 habitaciones · 3 camas · 2 baños',
      'imageUrl': 'https://picsum.photos/id/100/400/200',
    },
    {
      'title': 'Habitación en la selva',
      'subTitle':
          'Habitación privada · 2 huéspedes · 1 habitación · 1 cama · 1 baño',
      'imageUrl': 'https://picsum.photos/id/200/400/200',
    },
  ];
  final List<String> categories = [
    'All',
    'Beaches',
    'Museums',
    'Parks',
    'Restaurants'
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 20), // Añadir padding horizontal

          sliver: ProductsGrid(cardsData: cardsData),
        )
      ],
    );
  }
}
