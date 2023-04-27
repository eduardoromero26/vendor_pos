import 'package:flutter/material.dart';

class CustomElevatedButtonProvider extends ChangeNotifier {
  bool _isProcessing = false;

  bool get isProcessing => _isProcessing;

  void setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }
}
