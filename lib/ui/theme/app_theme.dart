import 'package:fluent_ui/fluent_ui.dart' show ColorExtension;
import 'package:flutter/material.dart';
import 'package:fterm/gen/fonts.gen.dart';
import 'package:xterm/xterm.dart';


@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  final Duration animationDuration;
  final Curve animationCurve;
  final Duration fastAnimationDuration;

  const AppTheme(
      {required this.animationDuration,
      required this.animationCurve,
      required this.fastAnimationDuration});

  @override
  ThemeExtension<AppTheme> copyWith() {
    return AppTheme(
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      fastAnimationDuration: fastAnimationDuration,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      fastAnimationDuration: fastAnimationDuration,
    );
  }
}

mixin AppThemeData {
  ThemeData materialTheme(BuildContext context, TerminalTheme colors) {
    var colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: colors.background,
      background: colors.background,
    );
    final bool isDark = colorScheme.brightness == Brightness.dark;

    // For surfaces that use primary color in light themes and surface color in dark
    final Color primarySurfaceColor =
        isDark ? colorScheme.surface : colorScheme.primary;
    final Color onPrimarySurfaceColor =
        isDark ? colorScheme.onSurface : colorScheme.onPrimary;
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      useMaterial3: true,
      indicatorColor: onPrimarySurfaceColor,
      primaryColor: primarySurfaceColor,
      fontFamily: FontFamily.mesloLGLForPowerline,
    ).copyWith(
      cardColor: colors.background,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: colors.background.toAccentColor().dark,
            foregroundColor: colors.foreground,
          ),
      hintColor: colors.foreground.withAlpha(100),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: colors.foreground,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.foreground,
        ),
      ),
    );
  }
}
