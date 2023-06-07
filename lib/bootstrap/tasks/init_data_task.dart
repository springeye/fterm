import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fterm/gen/assets.gen.dart';
import 'package:fterm/service/sync_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/app_config_cubit.dart';
import '../../bloc/home_tab_bloc.dart';
import '../../di/di.dart';
import '../../ui/connector/local_connector.dart';
import '../../ui/terminal_panel.dart';
import '../runner.dart';
import '../../utils/string_ext.dart';
import 'package:path/path.dart' as path;

class InitDataTask extends LaunchTask {
  @override
  LaunchTaskType get type => LaunchTaskType.Async;

  @override
  Future<void> initialize(LaunchContext context) async {
    debugPrint("InitDataTask");
    getIt<AppConfigCubit>().init();
    var connector = LocalConnector();
    getIt<HomeTabBloc>().add(HomeTabEvent.add(
      TerminalTab(connector.executable, connector, icon: connector.icon),
    ));
    var locale = await SharedPreferences.getInstance()
        .then((value) => value.getString("lang")?.toLocale());
    if (locale == null) {
      getIt<AppConfigCubit>().clearLocal();
    } else {
      getIt<AppConfigCubit>().setLocal(locale);
    }
    var syncService = getIt<SyncService>();
    syncService.pull().then(
          (value) => syncService.push(),
        );
    if (shellPath.isNotEmpty) {
      var list = Platform.environment["PATH"]?.split(":") ?? [];
      for (var p in list) {
        if (!path.split(p).contains("bin")) continue;
        try {
          var link = Link("$p/fterm");
          if (link.existsSync()) {
            await link.update(shellPath);
            print("update link $shellPath ==> ${"$p/fterm"} success");
          } else {
            await link.create(shellPath);
            print("create link $shellPath ==> ${"$p/term"} success");
          }

          break;
        } catch (e) {
          // print(e);
        }
      }
    }
  }
}

String get shellPath {
  if (Platform.isMacOS) {
    String dir = Platform.resolvedExecutable;
    return path.normalize(path.join(
        dir,
        "../..",
        "Frameworks/App.framework/Versions/Current/Resources/flutter_assets",
        Assets.scripts.fterm));
  }
  return "";
}
