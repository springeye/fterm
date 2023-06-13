import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:injectable/injectable.dart';
import 'package:webdav_client/webdav_client.dart' hide File;

import '../di/di.dart';
import '../model/backup_type.dart';
import 'ssh_config_bloc.dart';

part 'backup_state.dart';

part 'backup_cubit.freezed.dart';

@singleton
class BackupCubit extends Cubit<BackupState> {
  final FlutterSecureStorage storage;

  BackupCubit(this.storage)
      : super(const BackupState.initial(BackupType.disk, {}));

  Future<void> init() async {
    var type = await storage
        .read(key: "backup_type")
        .then((value) => value ?? "${BackupType.disk.index}")
        .then((value) => int.parse(value))
        .then((value) => BackupType.values[value]);
    var config = await storage
        .read(key: "backup_config")
        .then((value) => value ?? "{}")
        .then((value) => jsonDecode(value));
    emit(state.copyWith(type: type, config: config));
  }

  setConfig(Map<String, dynamic> config) async {
    emit(state.copyWith(config: HashMap.from(config)));
  }

  Future<Client> getWebDAVClient() async {
    var config = state.config;
    var client = newClient(
      config['host']!,
      user: config['username']!,
      password: config['password']!,
      debug: kDebugMode,
    );

    // Set the public request headers
    client.setHeaders({'accept-charset': 'utf-8'});

    // Set the connection server timeout time in milliseconds.
    client.setConnectTimeout(5000);

    // Set send data timeout time in milliseconds.
    client.setSendTimeout(5000);

    // Set transfer data time in milliseconds.
    client.setReceiveTimeout(5000);

    // Test whether the service can connect
    try {
      await client.ping();
    } catch (e) {
      print('$e');
    }
    return client;
  }

  setType(BackupType type) async {
    emit(state.copyWith(type: type));
  }

  Future<void> flush() async {
    await storage.write(key: "backup_config", value: jsonEncode(state.config));
    await storage.write(key: "backup_type", value: "${state.type.index}");
  }

  Future<void> import() async {
    var bloc = getIt<SshConfigBloc>();
    if (state.type == BackupType.disk) {
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
    } else {
      var client = await getWebDAVClient();
      var content = await client.read("fterm_export.ft");
      bloc.import(String.fromCharCodes(content));
    }
  }

  Future<void> export() {
    var bloc = getIt<SshConfigBloc>();
    return bloc.export().then((content) async {
      if (state.type == BackupType.disk) {
        var saveFile = await FilePicker.platform.saveFile(
          dialogTitle: "导出到...",
          fileName: "fterm_export.ft",
          initialDirectory: Platform.environment['HOME'] ??
              Platform.environment['USERPROFILE'],
        );
        if (saveFile != null) {
          await File(saveFile).writeAsString(content);
        }
      } else {
        var client = await getWebDAVClient();
        await client.write(
            "fterm_export.ft", Uint8List.fromList(content.codeUnits));
      }
    });
  }
}
