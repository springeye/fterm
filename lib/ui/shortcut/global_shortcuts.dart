import 'package:flutter/material.dart';
import 'intents.dart';
import 'shortcuts.dart' as shortcuts;

class GlobalShortcuts extends StatelessWidget {
  const GlobalShortcuts({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        shortcuts.tabOpen: const OpenTabIntent(),
        shortcuts.tabClose: const CloseTabIntent(),
        shortcuts.openSettings: const OpenSettingIntent(),
      },
      child: child,
    );
  }
}
