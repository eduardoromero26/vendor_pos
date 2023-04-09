import 'package:flutter/material.dart';
import 'package:vendor_pos/models/cart_model.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/atoms/cached_network_image/cached_network_image.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;
  final void Function() onIncrement;
  final void Function() onDecrement;

  const CartItem({
    super.key,
    required this.cartItem,
    required void Function() onRemove,
    required this.onIncrement,
    required this.onDecrement,
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
          CustomCachedNetworkImage(
            BORDER_RADIUS: BORDER_RADIUS,
            product: cartItem.product,
            IMAGE_HEIGHT: 70,
            IMAGE_WIDTH: 70,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cartItem.product.name,
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
                          onDecrement();
                        },
                        icon: const Icon(Icons.remove,
                            color: ColorTheme.secondaryColor, size: 16),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      Text('${cartItem.quantity}', style: QUANTITY_STYLE),
                      IconButton(
                        onPressed: () {
                          onIncrement();
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
            '\$${(double.parse(cartItem.product.price) * cartItem.quantity).toStringAsFixed(2)}',
            style: PRICE_STYLE.copyWith(fontWeight: FontWeight.w900),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
