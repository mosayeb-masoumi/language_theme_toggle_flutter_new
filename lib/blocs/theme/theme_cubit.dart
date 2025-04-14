import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:language_theme_toggle_flutter/theme/theme_provider.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';


class ThemeCubit extends Cubit<ThemeState> {
  final ThemeProvider _themeProvider;
  ThemeCubit(this._themeProvider) : super(ThemeInitial()) {
    // Emit the initial theme state
    emit(ThemeLoaded(_themeProvider.currentTheme));
  }


  Future<dynamic> toggleTheme() async{
    try{
      emit(ThemeLoading());
      // Toggle the theme
      // ThemeProvider themeProvider = ThemeProvider();
      await _themeProvider.toggleTheme();

      // Emit loaded state with the current theme
      emit(ThemeLoaded(_themeProvider.currentTheme));

    }on Exception{
      var a = 5;
    }
  }
}