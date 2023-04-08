import 'package:flutter/material.dart';
import 'package:vendor_pos/style/colors.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  final double price;
  final VoidCallback onAddToCart;

  const CardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.price,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
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
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(BORDER_RADIUS)),
                child: Image.network(
                  widget.imageUrl,
                  height: IMAGE_HEIGHT,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Chip(
                  backgroundColor: ColorTheme.whiteColor,
                  label: Text(
                    '\$${widget.price.toStringAsFixed(2)}',
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
              widget.title,
              style: TITLE_STYLE,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                HORIZONTAL_PADDING, 0, HORIZONTAL_PADDING, VERTICAL_PADDING),
            child: Text(
              widget.subTitle,
              style: SUBTITLE_STYLE,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.onAddToCart,
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
