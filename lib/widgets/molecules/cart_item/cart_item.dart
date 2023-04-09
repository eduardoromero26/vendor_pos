import 'package:flutter/material.dart';
import 'package:vendor_pos/style/colors.dart';

class CartItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int quantity;
  final double price;

  const CartItem({
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.price,
  });

  static const double BORDER_RADIUS = 10.0;
  static const TextStyle TITLE_STYLE = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle QUANTITY_STYLE = TextStyle(
    fontSize: 12,
    color: ColorTheme.secondaryColor,
  );
  static const TextStyle PRICE_STYLE = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorTheme.primaryColor,
        borderRadius: BorderRadius.circular(BORDER_RADIUS),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(BORDER_RADIUS),
            child: Image.network(
              imageUrl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TITLE_STYLE,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Añade la lógica para disminuir la cantidad aquí
                        },
                        icon: const Icon(Icons.remove,
                            color: ColorTheme.secondaryColor, size: 16),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      Text('$quantity', style: QUANTITY_STYLE),
                      IconButton(
                        onPressed: () {
                          // Añade la lógica para aumentar la cantidad aquí
                        },
                        icon: const Icon(Icons.add,
                            color: ColorTheme.secondaryColor, size: 16),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '\$${price * quantity}',
            style: PRICE_STYLE.copyWith(fontWeight: FontWeight.w900),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
