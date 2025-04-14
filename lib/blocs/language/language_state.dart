part of 'language_cubit.dart';

@immutable
abstract class LanguageState {
  const LanguageState();
}

class LanguageInitial extends LanguageState {
  const LanguageInitial();
}

class LanguageLoading extends LanguageState {
  const LanguageLoading();
}

class LanguageLoaded extends LanguageState {
  final String language;
  const LanguageLoaded(this.language);
}