part of 'theme_cubit.dart';


@immutable
abstract class ThemeState {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  const ThemeInitial();
}

class ThemeLoading extends ThemeState {
  const ThemeLoading();
}

class ThemeLoaded extends ThemeState {
  final ThemeData themeData;
  const ThemeLoaded(this.themeData);
}
