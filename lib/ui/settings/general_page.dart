import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/di/di.dart';
import 'package:fterm/utils/string_ext.dart';

import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/SS.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var configState = context.watch<AppConfigCubit>().state;
    var theme = configState.currentColor;
    var locale = configState.locale;
    return SettingsList(
      darkTheme: SettingsThemeData(
        settingsListBackground: theme.background.toAccentColor().dark,
        settingsSectionBackground: theme.background.toAccentColor().light,
      ),
      sections: [
        SettingsSection(
          tiles: <SettingsTile>[
            SettingsTile(
              leading: const Icon(FluentIcons.landscape_orientation),
              title: Text(SS.of(context).select_lang),
              trailing: null,
              value: ComboBox<String>(
                value: locale?.toString() ?? "system",
                items: [
                  ComboBoxItem(
                    value: "system",
                    child: Text(SS.of(context).system),
                  ),
                  ..._langs.keys.map((e) {
                    return ComboBoxItem(
                      value: e.toString(),
                      child: Text(_langs[e]!),
                    );
                  })
                ],
                onChanged: (e) {
                  if (e == null || e == "system") {
                    context.read<AppConfigCubit>().clearLocal();
                  } else {
                    context.read<AppConfigCubit>().setLocal(e.toLocale());
                  }
                },
              ),
            ),
            SettingsTile.switchTile(
              initialValue: configState.showFPS,
              onToggle: (v) {
                getIt<AppConfigCubit>().showFPS(v);
              },
              title: const Text("显示FPS"),
            ),
          ],
        ),
      ],
    );
  }
}

var _langs = {
  const Locale('en', 'US'): "English",
  const Locale('zh', 'CN'): "简体中文",
};
