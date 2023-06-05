import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fterm/bloc/app_config_cubit.dart';


import 'desktop_window.dart';
import 'shortcut/global_actions.dart';
import 'shortcut/global_shortcuts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/SS.dart';

class TermApp extends StatelessWidget {
  const TermApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var configState = context.watch<AppConfigCubit>().state;
    var locale = configState.locale;
    var theme = configState.currentColor;
    if (kDebugMode) {
      print("current locale:  ${locale.toString()}");
    }
    Widget widget = const GlobalShortcuts(
      child: GlobalActions(
        child: DesktopWindow(),
      ),
    );
    var background = theme.background;
    var bgAccentColor = background.toAccentColor();
    var foreground = theme.foreground;
    return FluentApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: FluentThemeData.light(),
      darkTheme: FluentThemeData.dark().copyWith(
        animationCurve: Curves.bounceIn,
        accentColor: bgAccentColor,
        cardColor: background,
        navigationPaneTheme: NavigationPaneThemeData(
          backgroundColor: bgAccentColor,
          highlightColor: foreground,
        ),
        resources: ResourceDictionary.dark(
          textFillColorPrimary: foreground,
          textFillColorSecondary: foreground,
          textFillColorTertiary: foreground,
          textFillColorInverse: foreground,
          subtleFillColorTertiary: bgAccentColor.dark,
          subtleFillColorSecondary: bgAccentColor.light,
          subtleFillColorTransparent: bgAccentColor.dark,
        ),
      ),
      localizationsDelegates: const [
        SS.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: SS.supportedLocales,
      locale: locale,
      builder: EasyLoading.init(),
      home: widget,
    );
  }
}
