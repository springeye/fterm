import 'package:bloc/bloc.dart';
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
        var items = await dao.findAllSSHConfig();
        emit(state.copyWith(configs: items));
      }, add: (e) async {
        var dao = getIt<SSHConfigDao>();
        dao.addSSHConfig(e.config);
        add(const SshConfigEvent.load());
      });
    });
  }

  void import() {}

  Future<List<SSHConfig>> export() async {
    var dao = getIt<SSHConfigDao>();
    var configs = await dao.findAllSSHConfig();
    return configs;
  }
}
