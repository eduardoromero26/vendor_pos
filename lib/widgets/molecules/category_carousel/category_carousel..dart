import 'package:vendor_pos/style/colors.dart';
import 'package:flutter/material.dart';

class CategoryCarousel extends StatefulWidget {
  final List<String> categories;

  const CategoryCarousel({super.key, required this.categories});

  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (BuildContext context, int index) {
          final category = widget.categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Chip(
                backgroundColor: _selectedIndex == index
                    ? ColorTheme.primaryColor
                    : ColorTheme.whiteColor,
                label: Text(
                  category,
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? Colors.white
                        : ColorTheme.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
