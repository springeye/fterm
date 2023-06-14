import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fterm/model/backup_type.dart';
import 'package:injectable/injectable.dart';

import '../../bloc/ssh_config_bloc.dart';
import '../../di/di.dart';
import '../backup_restore_adapter.dart';

@Singleton(as: BackupStoreAdapter)
@Named("local")
class LocalBackupStoreAdapter implements BackupStoreAdapter {
  @override
  Future<void> export() async {
    var bloc = getIt<SshConfigBloc>();
    var content = await bloc.export();
    var saveFile = await FilePicker.platform.saveFile(
      dialogTitle: "导出到...",
      fileName: "fterm_export.ft",
      initialDirectory:
          Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'],
    );
    if (saveFile != null) {
      await File(saveFile).writeAsString(content);
    }
  }

  @override
  Future<void> import() async {
    var bloc = getIt<SshConfigBloc>();
    var file = (await FilePicker.platform.pickFiles(
      dialogTitle: "选择备份文件...",
      allowedExtensions: ["ft"],
      initialDirectory:
          Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'],
    ))
        ?.files
        .firstOrNull;
    if (file != null) {
      var baseContent = await File(file.path!).readAsString();
      bloc.import(baseContent);
    }
  }

  @override
  // TODO: implement supportType
  BackupType get supportType => BackupType.disk;
}
