import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/atoms/search_bar/search_bar.dart';
import 'package:vendor_pos/widgets/atoms/text/wrap_text.dart';
import 'package:vendor_pos/widgets/molecules/card/card.dart';
import 'package:vendor_pos/widgets/molecules/card/card_grid.dart';
import 'package:vendor_pos/widgets/molecules/category_carousel/category_carousel..dart';
import 'package:flutter/material.dart';

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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
    },
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
    {
      'title': 'Bungalow en la ciudad',
      'subTitle':
          'Bungalow completo · 3 huéspedes · 1 habitación · 2 camas · 1 baño',
      'imageUrl': 'https://picsum.photos/id/300/400/200',
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
    final TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: ColorTheme.backgroundColor,
              expandedHeight: 100,
              collapsedHeight: 100,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SearchBar(
                      controller: searchController,
                      hintText: 'Search destinations...'),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: WrapText(
                      text: 'Categorias',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CategoryCarousel(categories: categories),
                const SizedBox(height: 20),
              ],
            )),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20), // Añadir padding horizontal

              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CardWidget(
                      title: cardsData[index]['title']!,
                      subTitle: cardsData[index]['subTitle']!,
                      imageUrl: cardsData[index]['imageUrl']!,
                    );
                  },
                  childCount: cardsData.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.2, // Ajustar el valor de childAspectRatio
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: ColorTheme.primaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: ColorTheme.primaryColor,
                ),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: ColorTheme.primaryColor,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
