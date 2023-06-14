import 'dart:convert';
import 'dart:io';

import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fterm/gen/assets.gen.dart';
import 'package:fterm/model/backup_type.dart';
import 'package:fterm/service/impl/local_backup_restore_adapter.dart';
import 'package:fterm/service/impl/webdav_backup_restore_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/app_config_cubit.dart';
import '../../bloc/backup_cubit.dart';
import '../../bloc/home_tab_bloc.dart';
import '../../bloc/profiles_search_cubit.dart';
import '../../bloc/ssh_config_bloc.dart';
import '../../db/database.dart';
import '../../di/di.dart';
import '../../service/backup_restore_adapter.dart';
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
    getIt<SshConfigBloc>().add(const SshConfigEvent.load());
    getIt<ProfilesSearchCubit>().load();
    var backup = getIt<BackupCubit>();
    backup.registerAdapter(getIt<BackupStoreAdapter>(instanceName: "webdav"));
    backup.registerAdapter(getIt<BackupStoreAdapter>(instanceName: "local"));
    backup.init().then((value) {
      return backup.import();
    }).then((value) {
      return backup.export();
    });
  }
}
