import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:language_theme_toggle_flutter/home_page.dart';
import 'package:language_theme_toggle_flutter/language/app_language.dart';
import 'package:language_theme_toggle_flutter/language/app_localizations.dart';
import 'package:language_theme_toggle_flutter/pref/share_pref.dart';
import 'package:language_theme_toggle_flutter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init(); // initialize here ! important
  runApp(const AppProviders());
}

class AppProviders extends StatelessWidget {
  const AppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppLanguage()),
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppLanguage, ThemeProvider>(
        builder: (context, languageProvider, themeProvider, child) {
          return MaterialApp(
            locale: languageProvider.appLocal,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('fa', ''),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            theme: themeProvider.currentTheme,
            darkTheme: ThemeData.dark(),
            themeMode: Prefs.getThemeMode(),

            home: const HomePage(),
          );
        });
  }
}
