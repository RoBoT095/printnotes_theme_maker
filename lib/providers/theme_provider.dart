import 'package:flutter/material.dart';

import 'package:printnotes_theme_maker/constants/theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  ColorScheme _colorScheme = AppThemes.lightDefault;
  String _schemeName = 'default_light';

  ColorScheme get colorScheme => _colorScheme;
  String get schemeName => _schemeName;

  void setStarterTheme(String starterTheme) {
    switch (starterTheme) {
      case 'default_light':
        _colorScheme = AppThemes.lightDefault;
        break;
      case 'default_dark':
        _colorScheme = AppThemes.darkDefault;
        break;
      case 'nordic_light':
        _colorScheme = AppThemes.lightNordic;
        break;
      case 'nordic_dark':
        _colorScheme = AppThemes.darkNordic;
        break;
      case 'green_apple_light':
        _colorScheme = AppThemes.lightGreenApple;
        break;
      case 'green_apple_dark':
        _colorScheme = AppThemes.darkGreenApple;
        break;
      case 'lavender_light':
        _colorScheme = AppThemes.lightLavender;
        break;
      case 'lavender_dark':
        _colorScheme = AppThemes.darkLavender;
        break;
      case 'strawberry_light':
        _colorScheme = AppThemes.lightStrawberry;
        break;
      case 'strawberry_dark':
        _colorScheme = AppThemes.darkStrawberry;
        break;
    }
    _schemeName = starterTheme;
    notifyListeners();
  }

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
