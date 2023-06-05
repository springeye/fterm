import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fterm/bloc/home_tab_bloc.dart';
import 'package:fterm/bootstrap/tasks/windows_task.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../bloc/app_config_cubit.dart';
import '../di/di.dart';
import '../model/ssh_config.dart';
import 'options.dart';
import 'tasks/app_widget_task.dart';
import 'tasks/init_data_task.dart';
import 'package:path/path.dart' if (dart.library.html) 'src/stub/path.dart'
    as path_helper;

enum LaunchTaskType { Async, Sync }

class LaunchContext {
  GetIt getIt;
  LaunchOptions options;

  LaunchContext(this.getIt, this.options);
}

abstract class LaunchTask {
  LaunchTaskType get type => LaunchTaskType.Async;

  Future<void> initialize(LaunchContext context);
}

@singleton
class AppLauncher {
  List<LaunchTask> tasks;

  AppLauncher() : tasks = List.from([]);

  void addTask(LaunchTask task) {
    tasks.add(task);
  }

  Future<void> launch(LaunchOptions options) async {
    final LaunchContext context = LaunchContext(getIt, options);
    for (LaunchTask task in tasks) {
      if (task.type == LaunchTaskType.Async) {
        task.initialize(context);
      } else {
        await task.initialize(context);
      }
    }
  }
}

abstract class EntryPoint {
  Widget create(LaunchOptions options);
}

typedef Options = Future<LaunchOptions> Function();

class AppRunner {
  static _ensureInitialized() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    var appDir = await getApplicationDocumentsDirectory();
    String subDir = "fterm";
    var path = path_helper.join(appDir.path, subDir);
    Hive.init(path);
    Hive.registerAdapter(SSHConfigAdapter());
    Hive.registerAdapter(AuthTypeAdapter());
  }

  static Future<void> run(EntryPoint root, Options options) async {
    await _ensureInitialized();
    await configureDependencies();
    var launchOptions = await options();
    getIt.registerSingleton(root);
    getIt.registerSingleton(AppConfigCubit(startLocal: launchOptions.locale));
    getIt.registerSingleton(HomeTabBloc(init: launchOptions.initTab));

    var appLauncher = getIt<AppLauncher>();

    appLauncher.addTask(InitDataTask());
    appLauncher.addTask(WindowsTask());
    appLauncher.addTask(InitAppWidgetTask());
    appLauncher.launch(launchOptions);
  }
}
