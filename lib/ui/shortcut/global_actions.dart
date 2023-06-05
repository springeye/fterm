import 'package:flutter/material.dart';
import 'package:fterm/ui/connector/local_connector.dart';
import 'package:fterm/ui/shortcut/intents.dart';
import 'package:fterm/ui/terminal_panel.dart';

import '../../bloc/home_tab_bloc.dart';
import '../../di/di.dart';
import '../popover.dart';

class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);
    return null;
  }
}

class GlobalActions extends StatelessWidget with ProfilesPop {
  const GlobalActions({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Actions(
      dispatcher: LoggingActionDispatcher(),
      actions: {
        OpenSettingIntent:
            CallbackAction<OpenSettingIntent>(onInvoke: (intent) => null),
        OpenTabIntent: CallbackAction<OpenTabIntent>(onInvoke: (intent) {
          var localConnector = LocalConnector();
          getIt<HomeTabBloc>().add(
            HomeTabEvent.add(
              TerminalTab(
                localConnector.title,
                localConnector,
                icon: localConnector.icon,
              ),
            ),
          );
          return null;
        }),
        CloseTabIntent: CallbackAction<CloseTabIntent>(onInvoke: (intent) {
          var tab = getIt<HomeTabBloc>()
              .state
              .tabs[getIt<HomeTabBloc>().state.currentIndex];
          getIt<HomeTabBloc>().add(HomeTabEvent.remove(tab));
          return null;
        }),
      },
      child: child,
    );
  }
}
