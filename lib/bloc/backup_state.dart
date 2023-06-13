part of 'backup_cubit.dart';

@freezed
class BackupState with _$BackupState {
  const factory BackupState.initial(
    BackupType type,
    Map<String, dynamic> config,
  ) = _Initial;
}
