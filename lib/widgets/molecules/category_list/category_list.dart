import 'package:eco_tours_yucatan/widgets/atoms/category_filter/category_item.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  final List<String> categories;

  const CategoryList({super.key, required this.categories});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: CategoryItem(
              title: widget.categories[index],
              isSelected: index == _selectedCategoryIndex,
            ),
          );
        },
      ),
    );
  }
}
