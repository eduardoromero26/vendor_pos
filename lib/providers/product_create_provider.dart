import 'package:flutter/material.dart';
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

  Future<void> createProductWithValidation(
      {required String? lastUploadedImageUrl,
      required String title,
      required String sku,
      required String description,
      required String price,
      required String stockQuantity,
      required int? selectedCategoryId,
      required BuildContext context}) async {
    if (lastUploadedImageUrl != null &&
        title.isNotEmpty &&
        description.isNotEmpty &&
        price.isNotEmpty &&
        stockQuantity.isNotEmpty) {
      createProduct({
        'name': title,
        'description': description,
        'regular_price': price,
        'sku': sku,
        'categories': [
          {
            'id': selectedCategoryId,
          }
        ],
        'images': [
          {
            'src': lastUploadedImageUrl,
          }
        ],
        'status': 'publish',
        'manage_stock': true,
        'stock_quantity': int.tryParse(stockQuantity) ?? 0,
      });
      SnackBar snackBar = SnackBar(
        content: const Text('Producto creado correctamente'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else {
      // Muestra un mensaje de error o un diálogo para informar al usuario que la imagen no se ha cargado correctamente o faltan campos requeridos
      SnackBar snackBar = SnackBar(
        content: const Text(
            'Error: La imagen no se ha cargado correctamente o faltan campos requeridos'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
