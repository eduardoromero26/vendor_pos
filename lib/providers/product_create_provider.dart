import 'package:flutter/foundation.dart';
import 'package:vendor_pos/service/create_product_service.dart';

class ProductCreateProvider extends ChangeNotifier {
  final CreateNewProductService _createNewProductService =
      CreateNewProductService();

  bool _isCreating = false;
  bool get isCreating => _isCreating;

  Future<void> createProduct(Map<String, dynamic> productData) async {
    _isCreating = true;
    notifyListeners();

    try {
      await _createNewProductService.createNewProduct(productData);
      _isCreating = false;
      notifyListeners();
    } catch (e) {
      _isCreating = false;
      notifyListeners();
      throw e;
    }
  }
}
