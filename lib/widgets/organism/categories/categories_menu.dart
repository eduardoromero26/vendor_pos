import 'package:flutter/material.dart';
import 'package:vendor_pos/widgets/atoms/text/wrap_text.dart';
import 'package:vendor_pos/widgets/molecules/category_carousel/category_carousel..dart';

class CategoriesMenu extends StatelessWidget {
  const CategoriesMenu({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: WrapText(
              text: 'Categorias', fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        CategoryCarousel(categories: categories),
        const SizedBox(height: 10),
      ],
    );
  }
}
