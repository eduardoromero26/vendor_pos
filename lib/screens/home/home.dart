import 'package:eco_tours_yucatan/style/colors.dart';
import 'package:eco_tours_yucatan/widgets/atoms/search_bar/search_bar.dart';
import 'package:eco_tours_yucatan/widgets/molecules/card/card_list.dart';
import 'package:eco_tours_yucatan/widgets/molecules/category_carousel/category_carousel..dart';
import 'package:eco_tours_yucatan/widgets/molecules/category_list/category_list.dart';
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(children: const [
                      Text('¿A donde quieres ir?',
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    SearchBar(
                        controller: searchController,
                        hintText: 'Search destinations...'),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Explora los Tours',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                CategoryList(categories: categories),
                const SizedBox(height: 8),
                CardListWidget(cardsData: cardsData),
              ],
            )),
            SliverToBoxAdapter(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Categorias',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                CategoryCarousel(categories: categories),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
