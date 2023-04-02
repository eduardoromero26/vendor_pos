import 'package:vendor_pos/style/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Sign up',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorTheme.primaryColor),
      ),
    );
  }
}
