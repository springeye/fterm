import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xterm/xterm.dart';


part 'app_config_state.dart';

part 'app_config_cubit.freezed.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit({Locale? startLocal})
      : super(AppConfigState.initial(locale: startLocal));

  void setCurrentColorScheme(String name) {
    var theme = state.colorSchemes[name];
    if (theme != null) {
      emit(state.copyWith(
        currentColor: theme,
        currentColorName: name,
      ));
    }
    SharedPreferences.getInstance()
        .then((value) => value.setString("color", name));
  }

  Future<void> init() async {
    emit(state.copyWith(colorSchemes: {
      "default": TerminalThemes.defaultTheme,
      "whiteOnBlack": TerminalThemes.whiteOnBlack
    }));
    var colors = await _loadColorSchemes();
    var sp = await SharedPreferences.getInstance();
    var color = sp.getString("color");
    var theme = colors[color];
    emit(state.copyWith(
      colorSchemes: colors,
      currentColor: theme ?? TerminalThemes.defaultTheme,
      currentColorName: color ?? "default",
    ));
  }

  Future<Map<String, TerminalTheme>> _loadColorSchemes() async {
    var colors = {
      "default": TerminalThemes.defaultTheme,
      "whiteOnBlack": TerminalThemes.whiteOnBlack
    };
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final keys = json
        .decode(manifestJson)
        .keys
        .where((String key) => key.startsWith('assets/colors/schemes'));
    for (var k in keys) {
      var name = k.substring(k.lastIndexOf("/") + 1);
      var lines = await rootBundle
          .loadString(k)
          .then<List<String>>((value) => value.split("\n"));
      var variables = {};
      List.from(lines)
          .where((element) => element.startsWith("#define"))
          .map((event) => event.split(" "))
          .map((event) => event.map((e) => e.trim()).toList())
          .map((event) => {event[1]: event[2]})
          .forEach((element) {
        if (element.isNotEmpty) {
          for (var element in element.entries) {
            variables[element.key] = element.value;
          }
        }
      });
      var values = <String, String>{};
      List.from(lines)
          .where((x) => x.startsWith('*.'))
          .map((x) => x.substring(2))
          .map<List<dynamic>>((x) => x.split(':').map((v) => v.trim()).toList())
          .forEach((element) {
        if (element.length > 1) {
          if (variables.isNotEmpty) {
            var newV = variables[element[1]];
            values[element[0]] = newV ?? element[1];
          } else {
            values[element[0]] = element[1];
          }
        }
      });
      // print(values);
      Color cursorColor = TerminalThemes.defaultTheme.cursor;
      Color selection = TerminalThemes.defaultTheme.selection;
      Color foreground = TerminalThemes.defaultTheme.foreground;
      Color background = TerminalThemes.defaultTheme.background;

      Color black = TerminalThemes.defaultTheme.black;
      Color red = TerminalThemes.defaultTheme.red;
      Color green = TerminalThemes.defaultTheme.green;
      Color yellow = TerminalThemes.defaultTheme.yellow;
      Color blue = TerminalThemes.defaultTheme.blue;
      Color magenta = TerminalThemes.defaultTheme.magenta;
      Color cyan = TerminalThemes.defaultTheme.cyan;
      Color white = TerminalThemes.defaultTheme.white;

      Color brightBlack = TerminalThemes.defaultTheme.brightBlack;
      Color brightRed = TerminalThemes.defaultTheme.brightRed;
      Color brightGreen = TerminalThemes.defaultTheme.brightGreen;
      Color brightYellow = TerminalThemes.defaultTheme.brightYellow;
      Color brightBlue = TerminalThemes.defaultTheme.brightBlue;
      Color brightMagenta = TerminalThemes.defaultTheme.brightMagenta;
      Color brightCyan = TerminalThemes.defaultTheme.brightCyan;
      Color brightWhite = TerminalThemes.defaultTheme.brightWhite;

      Color searchHitBackground =
          TerminalThemes.defaultTheme.searchHitBackground;
      Color searchHitBackgroundCurrent =
          TerminalThemes.defaultTheme.searchHitBackgroundCurrent;
      Color searchHitForeground =
          TerminalThemes.defaultTheme.searchHitForeground;
      for (var e in values.entries) {
        var color = Color(int.parse(e.value.replaceFirst("#", ""), radix: 16))
            .withAlpha(255);
        if (e.key == "foreground") {
          foreground = color;
        } else if (e.key == "background") {
          background = color;
        } else if (e.key == "cursorColor") {
          cursorColor = color;
        } else if (e.key == "colorBD") {
        } else if (e.key == "color0") {
          black = color;
        } else if (e.key == "color1") {
          red = color;
        } else if (e.key == "color2") {
          green = color;
        } else if (e.key == "color3") {
          yellow = color;
        } else if (e.key == "color4") {
          blue = color;
        } else if (e.key == "color5") {
          magenta = color;
        } else if (e.key == "color6") {
          cyan = color;
        } else if (e.key == "color7") {
          white = color;
        } else if (e.key == "color8") {
          brightBlack = color;
        } else if (e.key == "color9") {
          brightRed = color;
        } else if (e.key == "color10") {
          brightGreen = color;
        } else if (e.key == "color11") {
          brightYellow = color;
        } else if (e.key == "color12") {
          brightBlue = color;
        } else if (e.key == "color13") {
          brightMagenta = color;
        } else if (e.key == "color14") {
          brightCyan = color;
        } else if (e.key == "color15") {
          white = color;
        }
      }
      colors[name] = TerminalTheme(
        cursor: cursorColor,
        selection: selection,
        foreground: foreground,
        background: background,
        black: background,
        red: red,
        green: green,
        yellow: yellow,
        blue: blue,
        magenta: magenta,
        cyan: cyan,
        white: white,
        brightBlack: brightBlack,
        brightRed: brightRed,
        brightGreen: brightGreen,
        brightYellow: brightYellow,
        brightBlue: brightBlue,
        brightMagenta: brightMagenta,
        brightCyan: brightCyan,
        brightWhite: brightWhite,
        searchHitBackground: searchHitBackground,
        searchHitBackgroundCurrent: searchHitBackgroundCurrent,
        searchHitForeground: searchHitForeground,
      );
    }
    return colors;
  }

  void showFPS(bool show) {
    if (state.showFPS != show) {
      SharedPreferences.getInstance().then((value) {
        value.setBool("showFPS", show);
      });
      emit(state.copyWith(showFPS: show));
    }
  }

  void setLocal(Locale locale) {
    SharedPreferences.getInstance().then((value) {
      value.setString("lang", locale.toString());
    });
    if (state.locale != locale) {
      emit(state.copyWith(locale: locale));
    }
  }

  void clearLocal() {
    SharedPreferences.getInstance().then((value) => value.remove("lang"));
    emit(state.copyWith(locale: null));
  }
}
