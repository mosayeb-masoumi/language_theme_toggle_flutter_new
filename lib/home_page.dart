import 'package:flutter/material.dart';
import 'package:language_theme_toggle_flutter/blocs/language/language_cubit.dart';
import 'package:language_theme_toggle_flutter/blocs/theme/theme_cubit.dart';
import 'package:language_theme_toggle_flutter/language/app_language.dart';
import 'package:language_theme_toggle_flutter/language/app_localizations.dart';
import 'package:language_theme_toggle_flutter/second_page.dart';
import 'package:language_theme_toggle_flutter/theme/app_colors.dart';
import 'package:language_theme_toggle_flutter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: AppColors.primaryColor(context),

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('title')),
        backgroundColor: AppColors.primaryColor(context),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.translate('message')),

          const SizedBox(height: 20,),

          ElevatedButton(onPressed: (){
            // appLanguage.changeLanguage(const Locale("en"));
            context.read<LanguageCubit>().toggleLanguage();
          }, child: const Text("Toggle language")),


          ElevatedButton(onPressed: (){
            context.read<ThemeCubit>().toggleTheme(); // Trigger theme togg

          }, child: const Text("Toggle Theme")),


          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          }, child: const Text("goto second page"))
        ],
      ),
    );
  }
}