import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:vendor_pos/screens/home/home_screen.dart';
import 'package:vendor_pos/screens/menu/side_menu.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/atoms/search_bar/search_bar.dart';
import 'package:vendor_pos/widgets/organism/categories/categories_menu.dart';
import 'package:vendor_pos/widgets/organism/products_grid/products_grid.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<SideMenuItem> items = [
    SideMenuItem(
      // Priority of item to show on SideMenu, lower value is displayed at the top
      priority: 0,
      icon: Icon(Icons.home),
      badgeContent: Text(
        '3',
        style: TextStyle(color: Colors.white),
      ),
    ),
    SideMenuItem(
      priority: 1,
      icon: Icon(Icons.settings),
    ),
    SideMenuItem(
      priority: 2,
      icon: Icon(Icons.exit_to_app),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardsData = [
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
        'imageUrl': 'https://picsum.photos/id/200/400/200',
      },
      {
        'title': 'Casa de playa',
        'subTitle': 'Anillo',
        'imageUrl': 'https://picsum.photos/id/100/400/200',
      },
      {
        'title': 'Habitación en la selva',
        'subTitle': 'Collar',
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
    final TextEditingController searchController = TextEditingController();
    SideMenuController sideMenu = SideMenuController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.backgroundColor,
        body: CustomScrollView(slivers: <Widget>[
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
          SliverToBoxAdapter(child: CategoriesMenu(categories: categories)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 4), // Añadir padding horizontal

            sliver: ProductsGrid(cardsData: cardsData),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'addNewProduct');
          },
          backgroundColor: ColorTheme.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
