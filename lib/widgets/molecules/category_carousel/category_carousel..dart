import 'package:vendor_pos/style/colors.dart';
import 'package:flutter/material.dart';

class CategoryCarousel extends StatefulWidget {
  final List<String> categories;

  const CategoryCarousel({super.key, required this.categories});

  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  final double _itemHeight = 120;
  final double _itemWidth = 120;
  final double _itemSpacing = 10;
  final double _cornerRadius = 20;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _itemHeight,
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                height: _itemHeight,
                width: _itemWidth,
                decoration: BoxDecoration(
                  color: _selectedIndex == index
                      ? ColorTheme.primaryColor
                      : ColorTheme.whiteColor,
                  borderRadius: BorderRadius.circular(_cornerRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.beach_access,
                          size: 50,
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black),
                      Text(
                        category,
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
