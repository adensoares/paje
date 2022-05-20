import 'package:flutter/material.dart';

class AppColors {
  static const Color watermark = Color.fromRGBO(94, 120, 169, 0.07);
  static const Color primary = Color.fromRGBO(94, 120, 169, 1);
  static const Color secondary = Color.fromRGBO(255, 255, 255, 1);
  static const Color unselectedIcon = Color.fromRGBO(202, 208, 220, 1);

  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color onSecondary = Color.fromRGBO(94, 120, 169, 1);

  static const Color background = Color.fromRGBO(255, 255, 255, 1);
  static const Color error = Color.fromRGBO(176, 0, 32, 1);

  // Primary in MaterialColor
  static const MaterialColor customMaterialPrimary = MaterialColor(
    0xFF5E78A9,
    <int, Color>{
      50: Color.fromRGBO(94, 120, 169, .1),
      100: Color.fromRGBO(94, 120, 169, .2),
      200: Color.fromRGBO(94, 120, 169, .3),
      300: Color.fromRGBO(94, 120, 169, .4),
      400: Color.fromRGBO(94, 120, 169, .5),
      500: Color.fromRGBO(94, 120, 169, .6),
      600: Color.fromRGBO(94, 120, 169, .7),
      700: Color.fromRGBO(94, 120, 169, .8),
      800: Color.fromRGBO(94, 120, 169, .9),
      900: Color.fromRGBO(94, 120, 169, 1),
    },
  );
}
