import 'package:flutter/material.dart';
import 'package:vendor_pos/models/category_model.dart';
import 'package:vendor_pos/service/categories_service.dart';

class CategoriesProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      _categories = await CategoriesService().getCategories();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to fetch categories: $error');
    }
  }
}
