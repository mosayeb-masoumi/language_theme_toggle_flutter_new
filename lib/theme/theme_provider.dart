import 'package:flutter/material.dart';
import 'package:language_theme_toggle_flutter/pref/share_pref.dart';


class ThemeProvider{

  // ThemeData _currentTheme = ThemeData.light();


  // final ThemeMode _themeMode = Prefs.getThemeMode();
  // ThemeMode get themeMode => _themeMode;

  ThemeData _currentTheme = Prefs.getThemeMode() == ThemeMode.light
      ? ThemeData.light()
      :ThemeData.dark();

  ThemeData get currentTheme => _currentTheme;


  Future<void> toggleTheme() async {
    _currentTheme = _currentTheme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();

    // Save the selected theme mode in shared preferences
    await Prefs.setThemeMode(_currentTheme.brightness == Brightness.light
        ? ThemeMode.light
        : ThemeMode.dark);
  }

}