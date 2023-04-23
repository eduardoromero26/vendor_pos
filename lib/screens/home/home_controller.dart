import 'package:flutter/material.dart';
import 'package:vendor_pos/providers/products_provider.dart';
import 'package:provider/provider.dart';

class HomeController {
  int _selectedCategoryId = 0;

  void onScroll(BuildContext context, ScrollController scrollController) {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (_selectedCategoryId == -1 || _selectedCategoryId == 0) {
        Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
      } else {
        Provider.of<ProductsProvider>(context, listen: false)
            .fetchProductsByCategory(_selectedCategoryId);
      }
    }
  }

  void handleProducts(BuildContext context, String searchQuery) {
    Provider.of<ProductsProvider>(context, listen: false)
        .fetchProducts(searchQuery: searchQuery);
  }

  void handleCategorySearch(BuildContext context, int categoryId) {
    _selectedCategoryId = categoryId;

    if (_selectedCategoryId == -1) {
      Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
    } else {
      Provider.of<ProductsProvider>(context, listen: false)
          .fetchProductsByCategory(_selectedCategoryId);
    }
  }
}
