import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/style/colors.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage({
    super.key,
    required this.BORDER_RADIUS,
    required this.product,
    required this.IMAGE_HEIGHT,
    required this.IMAGE_WIDTH,
  });

  final double BORDER_RADIUS;
  final ProductsModel product;
  final double IMAGE_HEIGHT;
  final double IMAGE_WIDTH;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(BORDER_RADIUS)),
      child: CachedNetworkImage(
        imageUrl: product.images[0].src,
        height: IMAGE_HEIGHT,
        width: IMAGE_WIDTH,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: CircularProgressIndicator(
              color: ColorTheme.primaryColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
