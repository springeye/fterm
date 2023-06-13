import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fterm/db/ssh_config_dao.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:injectable/injectable.dart';

import '../di/di.dart';

part 'ssh_config_event.dart';

part 'ssh_config_state.dart';

part 'ssh_config_bloc.freezed.dart';

@singleton
class SshConfigBloc extends Bloc<SshConfigEvent, SshConfigState> {
  SshConfigBloc() : super(const SshConfigState.initial([])) {
    on<SshConfigEvent>((event, emit) async {
      await event.map(load: (e) async {
        var dao = getIt<SSHConfigDao>();
        await emit.forEach(dao.watchAllSSHConfig(), onData: (items) {
          return state.copyWith(configs: items);
        });
      }, add: (e) async {
        var dao = getIt<SSHConfigDao>();
        dao.saveSSHConfig(e.config);
      });
    });
  }

  Future<List<SSHConfig>> _export() async {
    var dao = getIt<SSHConfigDao>();
    var configs = await dao.findAllSSHConfig();
    return configs;
  }

  Future<String> export() async {
    var configs = await _export();
    return base64Encode(jsonEncode(configs).codeUnits);
  }

  Future<void> import(String data) async {
    var list = jsonDecode(String.fromCharCodes(base64Decode(data))) as List;
    var items = list.map((e) => SSHConfig.fromJson(e)).toList();
    var dao = getIt<SSHConfigDao>();
    await dao.saveSSHConfigs(items);
  }
}
