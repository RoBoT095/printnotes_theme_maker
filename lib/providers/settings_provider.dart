import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String _layout = 'grid';

  String get layout => _layout;

  void setLayout() {
    if (_layout == 'grid') {
      _layout = 'list';
    } else if (_layout == 'list') {
      _layout = 'tree';
    } else if (_layout == 'tree') {
      _layout = 'grid';
    }
    notifyListeners();
  }
}
