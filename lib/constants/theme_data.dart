import 'package:flutter/material.dart';

class AppThemes {
  static ColorScheme defaultScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(77, 143, 255, 1),
    onPrimary: Colors.white,
    secondary: Color.fromRGBO(68, 138, 255, 1),
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    surfaceContainer: Color.fromRGBO(246, 250, 255, 1),
    error: Colors.red,
    onError: Colors.yellow,
  );
}
