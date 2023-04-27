import 'package:flutter/material.dart';
import 'package:vendor_pos/style/colors.dart';

ThemeData customTheme() {
  return ThemeData(
    primaryColor: ColorTheme.primaryColor,
    scaffoldBackgroundColor: ColorTheme.backgroundColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorTheme.secondaryColor),
      bodyMedium: TextStyle(color: ColorTheme.secondaryColor),
      // Aquí puedes personalizar más estilos de texto según tus necesidades
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorTheme.primaryColor,
      iconTheme: IconThemeData(color: ColorTheme.whiteColor),
      textTheme: TextTheme(
        headline6: TextStyle(color: ColorTheme.whiteColor),
      ),
    ),
    colorScheme: const ColorScheme(
      primary: ColorTheme.primaryColor,
      secondary: ColorTheme.secondaryColor,
      background: ColorTheme.backgroundColor,
      surface: ColorTheme.backgroundColor,
      error: Colors.red,
      onPrimary: ColorTheme.whiteColor,
      onSecondary: ColorTheme.whiteColor,
      onSurface: ColorTheme.secondaryColor,
      onBackground: ColorTheme.secondaryColor,
      onError: ColorTheme.whiteColor,
      brightness: Brightness.light,
    ),
    // Aquí puedes personalizar más componentes según tus necesidades
  );
}
