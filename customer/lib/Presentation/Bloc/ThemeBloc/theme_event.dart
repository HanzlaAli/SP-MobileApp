part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class GetTheme extends ThemeEvent {}

class DarkTheme extends ThemeEvent {}

class LightTheme extends ThemeEvent {}
