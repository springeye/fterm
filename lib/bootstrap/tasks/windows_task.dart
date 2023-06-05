import 'package:fluent_ui/fluent_ui.dart';

import '../runner.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowsTask extends LaunchTask {
  @override
  LaunchTaskType get type => LaunchTaskType.Sync;

  @override
  Future<void> initialize(LaunchContext context) async {
    debugPrint("WindowsTask");
    doWhenWindowReady(() {
      const initialSize = Size(900, 600);
      appWindow.minSize = const Size(600, 400);
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}
