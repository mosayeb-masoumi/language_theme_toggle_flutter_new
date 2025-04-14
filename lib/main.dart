import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:language_theme_toggle_flutter/blocs/theme/theme_cubit.dart';
import 'package:language_theme_toggle_flutter/home_page.dart';
import 'package:language_theme_toggle_flutter/language/app_language.dart';
import 'package:language_theme_toggle_flutter/language/app_localizations.dart';
import 'package:language_theme_toggle_flutter/locator.dart';
import 'package:language_theme_toggle_flutter/pref/share_pref.dart';
import 'package:language_theme_toggle_flutter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'blocs/language/language_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init(); // initialize here ! important
  runApp(const AppProviders());
}

class AppProviders extends StatelessWidget {
  const AppProviders({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => ThemeCubit(ThemeProvider())),
      ],
      child: const MyApp());

  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {



    return BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          String language = Prefs.getLanguageCode(); // Default language
          if (state is LanguageLoaded) {
            language = state.language; // Get the current language from the state
          }

          return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                ThemeData themeData = ThemeData.light();
                if (themeState is ThemeLoaded) {
                  themeData = themeState.themeData; // Use the current theme from the state
                }

                return MaterialApp(
                  locale: Locale(language),
                  supportedLocales: const [
                    Locale('en', 'US'),
                    Locale('fa', ''),
                  ],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  theme: themeData,
                  // theme: BlocProvider.of<ThemeProvider>(context).currentTheme,
                  // darkTheme: ThemeData.dark(),
                  // themeMode: Prefs.getThemeMode(),
                  home: const HomePage(),
                );

              }
          );


        }
    );

  }
}
