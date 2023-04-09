import 'package:flutter/material.dart';
import 'package:vendor_pos/widgets/atoms/search_bar/search_bar.dart';
import 'package:vendor_pos/widgets/molecules/category_carousel/category_carousel..dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: SearchBar(
                  controller: TextEditingController(),
                  hintText: 'Search destinations...',
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  // Implementar la funcionalidad del filtro aquí
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          CategoryCarousel(categories: categories),
        ],
      ),
    );
  }
}
