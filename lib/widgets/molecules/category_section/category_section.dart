import 'package:flutter/material.dart';
import 'package:eco_tours_yucatan/widgets/atoms/category_filter/category_item.dart';

class CategorySection extends StatefulWidget {
  final List<String> categories;

  CategorySection({required this.categories});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
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
                child: CategoryItem(
                  title: category,
                  isSelected: index == _selectedIndex,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
