import '../model/backup_type.dart';

interface class BackupStoreAdapter {
  Future<void> export() {
    // TODO: implement export
    throw UnimplementedError();
  }

  Future<void> import() {
    // TODO: implement import
    throw UnimplementedError();
  }

  BackupType get supportType {
    // TODO: implement supportType
    throw UnimplementedError();
  }
}
