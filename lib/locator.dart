
import 'package:get_it/get_it.dart';
import 'package:language_theme_toggle_flutter/blocs/language/language_cubit.dart';
import 'package:language_theme_toggle_flutter/blocs/theme/theme_cubit.dart';

final locator = GetIt.instance;

void setUp(){

  locator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit(locator()));


  // locator.registerLazySingleton<DataCubit>(() => DataCubit(locator()));


  // AllInOnePage
  // locator.registerLazySingleton<MyRepository>(() => ImyRepository());
  // locator.registerLazySingleton<ServerCubit>(() => ServerCubit(locator()));
  // locator.registerLazySingleton<CounterNewCubit>(() => CounterNewCubit());
  //
  //
  // // locator.registerLazySingleton<StreamSubscriptionCubit>(() => StreamSubscriptionCubit(locator()));
  //
  // locator.registerLazySingleton<StreamRepository>(() => IStreamRepository());
  // locator.registerLazySingleton<StreamSubscriptionCubit>(() => StreamSubscriptionCubit(locator()));
}