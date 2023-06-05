import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:hive/hive.dart';
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
        var box = getIt<Box<SSHConfig>>();
        var items = box.values.toList();
        emit(state.copyWith(configs: items));
      }, add: (e) async {
        var box = getIt<Box<SSHConfig>>();
        box.put(e.config.id, e.config);
        add(const SshConfigEvent.load());
      });
    });
    add(const SshConfigEvent.load());
  }
}
