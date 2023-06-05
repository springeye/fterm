part of 'app_config_cubit.dart';

@freezed
class AppConfigState with _$AppConfigState {
  const factory AppConfigState({
    Locale? locale,
    @Default({}) Map<String, TerminalTheme> colorSchemes,
    @Default(TerminalThemes.defaultTheme) TerminalTheme currentColor,
    @Default("default") String currentColorName,
    @Default(false) bool showFPS,
  }) = _AppConfigState;

  factory AppConfigState.initial({Locale? locale, bool showFPS = false}) =>
      AppConfigState(
          colorSchemes: {},
          locale: locale,
          currentColorName: "default",
          currentColor: TerminalThemes.defaultTheme,
          showFPS: showFPS);
}
