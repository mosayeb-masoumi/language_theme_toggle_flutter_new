import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:language_theme_toggle_flutter/language/app_language.dart';
import 'package:language_theme_toggle_flutter/language/app_localizations.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());


  Future<dynamic> toggleLanguage() async{
    try{
      emit(LanguageLoading());
      // Get the current locale
      Locale currentLocale = AppLanguage().appLocal;

      // Determine the new locale
      Locale newLocale;
      if (currentLocale.languageCode == 'en') {
        newLocale = const Locale('fa'); // Switch to Persian
      } else {
        newLocale = const Locale('en'); // Switch to English
      }

      // Change the language in AppLanguage
      AppLanguage().changeLanguage(newLocale);

      await AppLocalizations(newLocale).load();

      // Emit loaded state with the new language code
      emit(LanguageLoaded(newLocale.languageCode));
    }on Exception{
      var a = 5;
    }
  }
}
