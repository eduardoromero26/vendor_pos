import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendor_pos/providers/categories_provider.dart';
import 'package:vendor_pos/providers/product_create_provider.dart';
import 'package:vendor_pos/service/image_upload_service.dart';
import 'package:vendor_pos/widgets/atoms/custom_text_field/custom_text_field.dart';
import 'package:vendor_pos/widgets/atoms/cutom_buttons/custom_elevated_button.dart';
import 'package:vendor_pos/widgets/atoms/text/wrap_text.dart';

import 'package:vendor_pos/models/category_model.dart';

class CreateProductScreen extends StatefulWidget {
  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _stockQuantityController =
      TextEditingController();
  ImageUploadService imageUploadService = ImageUploadService();
  int? _selectedCategoryId;
  List<String> _uploadImages = [];
  File? _imageFile;

  Widget _buildCategoryDropdown(List<CategoryModel> categories) {
    return DropdownButton<int>(
      value: _selectedCategoryId,
      hint: Text('Select a category'),
      onChanged: (int? newValue) {
        setState(() {
          _selectedCategoryId = newValue;
        });
      },
      items: categories.map<DropdownMenuItem<int>>((CategoryModel category) {
        return DropdownMenuItem<int>(
          value: category.id,
          child: Text(category.name as String),
        );
      }).toList(),
    );
  }

  Future<void> pickMultipleImage() async {
    var images = await ImagePicker().pickMultiImage();
    if (images != null && images.isNotEmpty) {
      List<String> uploadedImagePaths =
          await imageUploadService.uploadImages(images);
      setState(() {
        _uploadImages.addAll(uploadedImagePaths);
      });
    } else {
      print("No image picked");
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductCreateProvider productCreateProvider = ProductCreateProvider();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: WrapText(
          text: 'Crear nuevo producto',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontColor: Colors.white,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.vertical,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                    ),
                    child: Column(
                      children: [
                        WrapText(
                          text: 'Introduce la información del producto',
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _titleController,
                                hintText: 'Título',
                                prefixIcon: Icons.title,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomTextField(
                                controller: _descriptionController,
                                hintText: 'Descripción',
                                prefixIcon: Icons.description,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _priceController,
                                hintText: 'Precio',
                                prefixIcon: Icons.attach_money,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomTextField(
                                controller: _stockQuantityController,
                                hintText: 'Cantidad en stock',
                                prefixIcon: Icons.inventory,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Consumer<CategoriesProvider>(
                          builder: (context, categoriesProvider, _) {
                            List<CategoryModel> categories =
                                categoriesProvider.categories;
                            return _buildCategoryDropdown(categories);
                          },
                        ),
                        if (_imageFile != null) ...[
                          Image.file(_imageFile!),
                          SizedBox(height: 10),
                        ],
                        CustomElevatedButton(
                            onPressed: () async {
                              await pickMultipleImage();
                            },
                            text:
                                'Seleccionar imagen del producto desde la galería del dispositivo'),
                        const SizedBox(height: 40),
                        CustomElevatedButton(
                          onPressed: () {
                            productCreateProvider.createProduct({
                              'name': _titleController.text,
                              'description': _descriptionController.text,
                              'regular_price': _priceController.text,
                              'categories': [
                                {
                                  'id': _selectedCategoryId,
                                }
                              ],
                              'images': _uploadImages,
                              'status': 'publish',
                              'stockQuantity': _stockQuantityController.text,
                            });
                          },
                          text: 'Crear Producto',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
