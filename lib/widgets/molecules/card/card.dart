import 'package:flutter/material.dart';
import 'package:vendor_pos/models/cart_model.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/atoms/cached_network_image/cached_network_image.dart';

class CardWidget extends StatelessWidget {
  final ProductsModel product;
  void Function(CartItemModel) onAddToCart;

  CardWidget({
    key,
    required this.onAddToCart,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double BORDER_RADIUS = 20.0;
    const double IMAGE_HEIGHT = 120.0;
    const double HORIZONTAL_PADDING = 16.0;
    const double VERTICAL_PADDING = 12.0;

    const TextStyle TITLE_STYLE = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    const TextStyle SUBTITLE_STYLE = TextStyle(
      fontSize: 14,
      color: Colors.grey,
    );

    const TextStyle BUTTON_TEXT_STYLE = TextStyle(
      fontSize: 14,
    );

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BORDER_RADIUS)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CustomCachedNetworkImage(
                BORDER_RADIUS: BORDER_RADIUS,
                product: product,
                IMAGE_HEIGHT: IMAGE_HEIGHT,
                IMAGE_WIDTH: double.infinity,
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Chip(
                  elevation: 2,
                  backgroundColor: ColorTheme.whiteColor,
                  label: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                        color: ColorTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                HORIZONTAL_PADDING, VERTICAL_PADDING, HORIZONTAL_PADDING, 0),
            child: Text(
              product.name,
              style: TITLE_STYLE,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                HORIZONTAL_PADDING, 0, HORIZONTAL_PADDING, VERTICAL_PADDING),
            child: Text(
              product.categories[0].name.toString(),
              style: SUBTITLE_STYLE,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => onAddToCart(CartItemModel(
                  product: product,
                  quantity: 1,
                )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: BUTTON_TEXT_STYLE,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
