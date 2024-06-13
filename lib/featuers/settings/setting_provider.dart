import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  int currentIndex = 0;
  ThemeMode currentTheme = ThemeMode.light;

  // changeIndex(int index) {
  //   currentIndex = index;
  //   notifyListeners();
  // }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
