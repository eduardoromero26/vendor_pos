import 'package:flutter/material.dart';
import 'package:vendor_pos/style/colors.dart';

class CustomSliverAppBar extends StatefulWidget {
  final TextEditingController searchController;
  final List<String> categories;

  const CustomSliverAppBar({
    required this.searchController,
    required this.categories,
  });

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  int _selectedIndex = 0;

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
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          // Aquí puedes manejar el evento de envío, por ejemplo:
                          // print(widget.searchController.text);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = widget.categories[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: categoryPaddingHorizontal),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(borderRadius),
                              color: _selectedIndex == index
                                  ? ColorTheme.primaryColor
                                  : ColorTheme.whiteColor,
                              border: _selectedIndex != index
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
                                category,
                                style: TextStyle(
                                    color: _selectedIndex == index
                                        ? Colors.white
                                        : ColorTheme.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
