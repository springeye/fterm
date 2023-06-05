part of 'ssh_config_bloc.dart';

@freezed
class SshConfigEvent with _$SshConfigEvent {
  const factory SshConfigEvent.load() = _Load;

  const factory SshConfigEvent.add(SSHConfig config) = _Add;
}
