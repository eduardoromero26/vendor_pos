import 'package:flutter/material.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/molecules/cart_item/cart_item.dart';

class ShoppingCart extends StatelessWidget {
  final List<CartItem> items;

  const ShoppingCart({required this.items});

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  static const double BORDER_RADIUS = 10.0;
  static const TextStyle TOTAL_PRICE_STYLE = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ColorTheme.secondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorTheme.backgroundColor,
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: ColorTheme.primaryColor,
              thickness: 1,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Total:',
                    style: TOTAL_PRICE_STYLE,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: TOTAL_PRICE_STYLE.copyWith(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
