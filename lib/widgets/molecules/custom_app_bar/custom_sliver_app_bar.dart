import 'package:flutter/material.dart';
import 'package:vendor_pos/models/category_model.dart';
import 'package:vendor_pos/style/colors.dart';

class CustomSliverAppBar extends StatefulWidget {
  final TextEditingController searchController;
  final List<CategoryModel> categories;
  final void Function(String) onSearch;
  final void Function(int) onCategorySelected;

  const CustomSliverAppBar({
    super.key,
    required this.searchController,
    required this.categories,
    required this.onSearch,
    required this.onCategorySelected,
  });

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  int _selectedIndex = -1;
  // Constantes
  final double appBarHeight = 80;
  final EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 8);
  final double borderRadius = 20;
  final double categoryPaddingHorizontal = 5;
  final double categoryPaddingVertical = 8;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorTheme.backgroundColor,
      expandedHeight: appBarHeight,
      collapsedHeight: appBarHeight,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: padding,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: widget.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () =>
                            widget.onSearch(widget.searchController.text),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final category in widget.categories
                            .where((c) => c.name != 'Sin categorizar'))
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_selectedIndex ==
                                    widget.categories.indexOf(category)) {
                                  _selectedIndex = -1;
                                  category.isSelected = false;
                                } else {
                                  _selectedIndex =
                                      widget.categories.indexOf(category);
                                  category.isSelected = true;
                                }

                                widget.onCategorySelected(_selectedIndex);

                                for (final otherCategory in widget.categories
                                    .where((c) =>
                                        c != category &&
                                        c.name != 'Sin categorizar')) {
                                  otherCategory.isSelected = false;
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: categoryPaddingHorizontal),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius),
                                  color: category.isSelected
                                      ? ColorTheme
                                          .primaryColor // fondo de color primary si está seleccionado
                                      : ColorTheme.whiteColor,
                                  border: _selectedIndex !=
                                              widget.categories
                                                  .indexOf(category) &&
                                          !category.isSelected
                                      ? Border.all(
                                          color: ColorTheme.secondaryColor,
                                          width: 1)
                                      : null,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: categoryPaddingVertical),
                                child: Center(
                                  child: Text(
                                    category.name,
                                    style: TextStyle(
                                      color: category.isSelected
                                          ? Colors
                                              .white // texto en color blanco si está seleccionado
                                          : ColorTheme.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
