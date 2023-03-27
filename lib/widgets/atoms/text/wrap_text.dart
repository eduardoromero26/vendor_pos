import 'package:eco_tours_yucatan/style/colors.dart';
import 'package:flutter/material.dart';

class WrapText extends StatelessWidget {
  String text;
  double fontSize;
  Color fontColor;
  FontWeight fontWeight;

  WrapText({
    required this.text,
    required this.fontSize,
    this.fontColor = ColorTheme.secondaryColor,
    this.fontWeight = FontWeight.normal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Text(text,
          style: TextStyle(
              fontFamily: 'Avenir',
              color: fontColor,
              fontSize: fontSize,
              fontWeight: fontWeight)),
    ]);
  }
}
