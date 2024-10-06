import 'package:flutter/material.dart';
import 'package:printnotes_theme_maker/constants/theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  ColorScheme _colorScheme = AppThemes.defaultScheme;

  ColorScheme get colorScheme => _colorScheme;

  void updateBrightness(Brightness brightness) {
    _colorScheme = _colorScheme.copyWith(brightness: brightness);
    notifyListeners();
  }

  void updateColor(String property, Color color) {
    _colorScheme = _colorScheme.copyWith(
      primary: property == 'primary' ? color : _colorScheme.primary,
      onPrimary: property == 'onPrimary' ? color : _colorScheme.onPrimary,
      secondary: property == 'secondary' ? color : _colorScheme.secondary,
      onSecondary: property == 'onSecondary' ? color : _colorScheme.onSecondary,
      surface: property == 'surface' ? color : _colorScheme.surface,
      onSurface: property == 'onSurface' ? color : _colorScheme.onSurface,
      surfaceContainer: property == 'surfaceContainer'
          ? color
          : _colorScheme.surfaceContainer,
    );
    notifyListeners();
  }
}

ThemeData themeDataFromColorScheme(ColorScheme colorScheme) {
  return ThemeData(colorScheme: colorScheme);
}
