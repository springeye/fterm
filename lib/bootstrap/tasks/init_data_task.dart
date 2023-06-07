import 'dart:convert';
import 'dart:io';

import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fterm/gen/assets.gen.dart';
import 'package:fterm/service/sync_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/app_config_cubit.dart';
import '../../bloc/home_tab_bloc.dart';
import '../../db/database.dart';
import '../../di/di.dart';
import '../../ui/connector/local_connector.dart';
import '../../ui/terminal_panel.dart';
import '../runner.dart';
import '../../utils/string_ext.dart';

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
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').addCallback(
      Callback(onConfigure: (db) async {
        print("db path=>>${db.path}");
        var cipherVersion = await db.rawQuery("PRAGMA cipher_version");
        if (cipherVersion.isEmpty) {
          throw StateError(
              'SQLCipher library is not available, please check your dependencies!');
        }
        debugPrint(cipherVersion.toString());
        db.execute("PRAGMA key = '123456';");
      }),
    ).build();
    database.personDao.findAllPeople();
  }
}
