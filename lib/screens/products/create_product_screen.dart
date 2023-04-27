import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vendor_pos/providers/categories_provider.dart';
import 'package:vendor_pos/providers/product_create_provider.dart';
import 'package:vendor_pos/providers/upload_image_provider.dart';
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
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _stockQuantityController =
      TextEditingController();
  ImageUploadService imageUploadService = ImageUploadService();
  int? _selectedCategoryId;

  Widget _buildCategoryDropdown(List<CategoryModel> categories) {
    return DropdownButton<int>(
      alignment: Alignment.centerLeft,
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
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 120,
                vertical: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: Consumer<UploadImageProvider>(
                  builder: (context, uploadImageProvider, _) {
                    String? lastUploadedImageUrl =
                        uploadImageProvider.lastUploadedImageUrl;
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    WrapText(
                                      text:
                                          'Introduce la información del producto',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 50),
                                    CustomTextField(
                                      controller: _titleController,
                                      hintText: 'Título',
                                      prefixIcon: Icons.title,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: _skuController,
                                      hintText: 'SKU',
                                      prefixIcon: Icons.inventory_2,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: _priceController,
                                      hintText: 'Precio',
                                      prefixIcon: Icons.attach_money,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: _descriptionController,
                                      hintText: 'Descripción',
                                      prefixIcon: Icons.description,
                                    ),
                                    const SizedBox(height: 20),
                                    CustomTextField(
                                      controller: _stockQuantityController,
                                      hintText: 'Cantidad en stock',
                                      prefixIcon: Icons.inventory,
                                    ),
                                    const SizedBox(height: 20),
                                    Consumer<CategoriesProvider>(
                                      builder:
                                          (context, categoriesProvider, _) {
                                        List<CategoryModel> categories =
                                            categoriesProvider.categories;
                                        return _buildCategoryDropdown(
                                            categories);
                                      },
                                    ),
                                    const SizedBox(height: 40),
                                    CustomElevatedButton(
                                      onPressed: () async {
                                        await productCreateProvider
                                            .createProductWithValidation(
                                          lastUploadedImageUrl:
                                              uploadImageProvider
                                                  .lastUploadedImageUrl,
                                          title: _titleController.text,
                                          sku: _skuController.text,
                                          description:
                                              _descriptionController.text,
                                          price: _priceController.text,
                                          stockQuantity:
                                              _stockQuantityController.text,
                                          selectedCategoryId:
                                              _selectedCategoryId,
                                          context: context,
                                        );
                                      },
                                      text: 'Crear Producto',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: lastUploadedImageUrl != null
                                                ? Image.network(
                                                    lastUploadedImageUrl,
                                                    fit: BoxFit.cover,
                                                  )
                                                : InkWell(
                                                    onTap: () async {
                                                      await uploadImageProvider
                                                          .pickImage();
                                                    },
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Icon(
                                                            Icons
                                                                .upload_rounded,
                                                            color: Colors.white,
                                                            size: 50,
                                                          ),
                                                          Text(
                                                            'Subir imagen',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          if (lastUploadedImageUrl != null)
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () {
                                                  // Código para eliminar la imagen y actualizar el estado
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<UploadImageProvider>(context, listen: false).reset();
    });
  }
}
