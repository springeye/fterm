part of 'ssh_config_bloc.dart';

@freezed
class SshConfigState with _$SshConfigState {
  const factory SshConfigState.initial(List<SSHConfig> configs) = _Initial;
}
