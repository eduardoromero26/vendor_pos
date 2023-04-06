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
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              // Acción para ver más detalles del producto
            },
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Container(
                margin: EdgeInsets.all(8),
                child: Image.network(
                  widget.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
            child: Text(
              widget.subTitle,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
            child: Text(
              '\$${widget.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _decrementQuantity,
                        icon: Icon(Icons.remove),
                      ),
                      Text(
                        '$_quantity',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: _incrementQuantity,
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onAddToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Icon(Icons.add_shopping_cart),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
