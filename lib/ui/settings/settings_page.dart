import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bloc/ssh_config_bloc.dart';
import 'package:fterm/model/tab_item.dart';

import '../../bloc/app_config_cubit.dart';
import 'sync/sync_page.dart';
import 'theme_page.dart';
import 'general_page.dart';
import 'hosts_page.dart';
import 'package:flutter_gen/gen_l10n/SS.dart';

class SettingsTab extends TabItem {
  SettingsTab() {
    title.value = const Text("Settings");
    content.value = const SettingPage();
  }
}

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int topIndex = 0;
  var displayMode = PaneDisplayMode.open;

  @override
  Widget build(BuildContext context) {
    var configState = context.watch<AppConfigCubit>().state;
    var theme = configState.currentColor;
    return BlocBuilder<SshConfigBloc, SshConfigState>(
      builder: (context, state) {
        var ss = SS.of(context);
        return Container(
          padding: const EdgeInsets.only(top: 10),
          child: NavigationView(
            pane: NavigationPane(
              selected: topIndex,
              size: const NavigationPaneSize(openMaxWidth: 250),
              onChanged: (index) => setState(() => topIndex = index),
              displayMode: displayMode,
              items: [
                PaneItem(
                  icon: const Icon(FluentIcons.apps_content),
                  title: Text(ss.general),
                  body: Container(
                    color: theme.background,
                    child: const GeneralPage(),
                  ),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.apps_content),
                  title: Text(ss.theme),
                  body: Container(
                    color: theme.background,
                    child: const ThemePage(),
                  ),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.connect_contacts),
                  title: Text(ss.hosts),
                  body: Container(
                    color: theme.background,
                    child: const HostPage(),
                  ),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.sync),
                  title: Text(ss.sync),
                  body: Container(
                    color: theme.background,
                    child: Text("coming soon!"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
