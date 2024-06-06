import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:theme_stckd/app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final _themeService = locator<ThemeService>();

  //Toggle Theme Mode
  void toggleTheme() {
    _themeService.toggleDarkLightTheme();
  }

  //Set theme Mode to Light
  void setThemeModeLight(context) {
    getThemeManager(context).setThemeMode(ThemeMode.light);
  }

  //Set theme Mode to Dark
  void setThemeModeDark(context) {
    getThemeManager(context).setThemeMode(ThemeMode.dark);
  }
}
