import 'package:flutter/material.dart';

import '../runner.dart';

class InitAppWidgetTask extends LaunchTask {
  @override
  LaunchTaskType get type => LaunchTaskType.Sync;

  @override
  Future<void> initialize(LaunchContext context) async {
    debugPrint("InitAppWidgetTask");
    Widget app = context.getIt<EntryPoint>().create(context.options);
    runApp(app);
    return Future(() => {});
  }
}
