import 'package:flutter/material.dart';

class AppColors {
  static const Color darkGreen = Color(0xFF104437);
  static const Color greyDivider = Color(0xFFA2BEB7);
  static const Color red = Color(0xFFC21717);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const Color colorPrimary = Color(0xFF104437);

  AppColors._();

  static const int _darkbluePrimaryValue = 0xFF0D0044;
  static const MaterialColor darkblueMaterialColor =
      MaterialColor(_darkbluePrimaryValue, <int, Color>{
    50: Color(0xFFE2E0E9),
    100: Color(0xFFB6B3C7),
    200: Color(0xFF8680A2),
    300: Color(0xFF564D7C),
    400: Color(0xFF312660),
    500: Color(_darkbluePrimaryValue),
    600: Color(0xFF0B003E),
    700: Color(0xFF090035),
    800: Color(0xFF07002D),
    900: Color(0xFF03001F),
  });
}
