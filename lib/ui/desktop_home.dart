import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart'
    show
        CloseButtonVisibilityMode,
        FluentApp,
        FluentTheme,
        FluentThemeData,
        Tab,
        TabView,
        TabWidthBehavior;
import 'package:flutter/material.dart' hide Tab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/bloc/home_tab_bloc.dart';
import 'package:fterm/ui/connector/local_connector.dart';
import 'package:fterm/ui/popover.dart';
import 'package:fterm/ui/terminal_panel.dart';
import 'package:fterm/ui/theme/app_theme.dart';
import 'package:uuid/uuid.dart';

import '../di/di.dart';
import '../model/tab_item.dart';
import 'settings/settings_page.dart';
import 'windows/window_caption.dart';
import 'dart:developer' as developer;

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome>
    with ProfilesPop, AppThemeData {
  @override
  Widget build(BuildContext context) {
    var configState = context.watch<AppConfigCubit>().state;
    return BlocConsumer<HomeTabBloc, HomeTabState>(
      listener: (context, state) {
        if (state.tabs.isEmpty) {
          exit(0);
        }
      },
      buildWhen: (p, c) => p != c,
      builder: (context, state) {
        developer.log("DesktopHome.build");
        final tabs = state.tabs;
        final current = state.currentIndex;
        var childs = tabs.map((e) {
          return Tab(
            key: Key(const Uuid().v4()),
            text: ValueListenableBuilder<Widget?>(
              valueListenable: e.title,
              builder: (context, content, child) {
                return content ?? const Placeholder();
              },
            ),
            icon: ValueListenableBuilder<Widget?>(
              valueListenable: e.icon,
              builder: (context, content, child) {
                return content ?? const SizedBox.shrink();
              },
            ),
            body: Container(
              color: configState.currentColor.background,
              child: ValueListenableBuilder<Widget?>(
                valueListenable: e.content,
                builder: (context, content, child) {
                  return content ?? const Placeholder();
                },
              ),
            ),
            onClosed: () {
              getIt<HomeTabBloc>().add(
                HomeTabEvent.remove(e),
              );
            },
          );
        }).toList();
        return Container(
          color: configState.currentColor.background,
          child: Stack(
            children: [
              TabView(
                currentIndex: current,
                tabWidthBehavior: TabWidthBehavior.equal,
                shortcutsEnabled: false,
                header: (Platform.isMacOS)
                    ? const SizedBox(
                        width: 50,
                      )
                    : null,
                footer: Container(
                  padding: EdgeInsets.only(right: Platform.isMacOS ? 50 : 195),
                  child: Builder(builder: (context) {
                    return IconButton(
                      padding: const EdgeInsets.all(5),
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {
                        showProfilesPop(
                          context,
                          themeData:
                              materialTheme(context, configState.currentColor),
                        ).then((connector) {
                          if (connector != null) {
                            getIt<HomeTabBloc>().add(HomeTabEvent.add(
                                TerminalTab(connector.title, connector,
                                    icon: connector.icon)));
                          }
                        });
                      },
                    );
                  }),
                ),
                closeButtonVisibility: tabs.length > 1
                    ? CloseButtonVisibilityMode.always
                    : CloseButtonVisibilityMode.never,
                onNewPressed: () {
                  var connector = LocalConnector();
                  TabItem item = TerminalTab(
                    connector.executable,
                    connector,
                    icon: connector.icon,
                  );
                  getIt<HomeTabBloc>().add(HomeTabEvent.add(item));
                },
                onChanged: (index) {
                  getIt<HomeTabBloc>().add(
                    HomeTabEvent.change(index),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  getIt<HomeTabBloc>().add(
                    HomeTabEvent.reorder(oldIndex, newIndex),
                  );
                },
                tabs: childs,
              ),
              if (!Platform.isMacOS)
                const Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 200,
                    height: kToolbarHeight / 1.4,
                    child: WindowCaption(
                      backgroundColor: Colors.transparent,
                      brightness: Brightness.dark,
                    ),
                  ),
                ),
              Positioned(
                top: 0,
                right: Platform.isMacOS ? 10 : 135,
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    getIt<HomeTabBloc>().add(
                      HomeTabEvent.add(
                        SettingsTab(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
