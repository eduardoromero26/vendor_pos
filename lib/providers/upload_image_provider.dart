import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_pos/service/image_upload_service.dart';

class UploadImageProvider with ChangeNotifier {
  ImageUploadService imageUploadService = ImageUploadService();
  File? _imageFile;
  List<String> _uploadImages = [];

  File? get imageFile => _imageFile;
  List<String> get uploadImages => _uploadImages;

  String? get lastUploadedImageUrl {
    return uploadImages.isNotEmpty ? uploadImages.last : null;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _isLoading = true;
      notifyListeners();
      String uploadedImagePath =
          await imageUploadService.uploadImage(image, "products");
      _uploadImages.add(uploadedImagePath);
      _imageFile = File(image.path);
      _isLoading = false;
      notifyListeners();
    } else {
      print("No image picked");
    }
  }

  void reset() {
    _imageFile = null;
    _uploadImages.clear();
    notifyListeners();
  }
}
