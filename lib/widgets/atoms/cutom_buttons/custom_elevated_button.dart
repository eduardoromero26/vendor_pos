import 'package:vendor_pos/style/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isProcessing;

  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    this.isProcessing = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(ColorTheme.primaryColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
                vertical: 20, horizontal: 40)), // Aumenta el padding aquí
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: isProcessing
          ? const SizedBox(
              width: 160,
              height: 120,
              child: CircularProgressIndicator(
                color: ColorTheme.secondaryColor,
                strokeWidth: 2.5,
              ),
            )
          : Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
    );
  }
}
