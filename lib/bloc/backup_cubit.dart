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
import '../service/backup_restore_adapter.dart';
import 'ssh_config_bloc.dart';

part 'backup_state.dart';

part 'backup_cubit.freezed.dart';

const String _keyType = "backup_type";
const String _keyConfig = "backup_config";

@singleton
class BackupCubit extends Cubit<BackupState> implements BackupStoreAdapter {
  final FlutterSecureStorage storage;
  final MacOsOptions macOsOptions =
      MacOsOptions.defaultOptions.copyWith(synchronizable: true);
  final List<BackupStoreAdapter> _backupAdapters = [];

  void registerAdapter(BackupStoreAdapter adapter) {
    _backupAdapters.add(adapter);
  }

  void unregisterAdapter(BackupStoreAdapter adapter) {
    _backupAdapters.remove(adapter);
  }

  BackupCubit(this.storage)
      : super(const BackupState.initial(BackupType.disk, {}));

  Future<void> init() async {
    var type = await storage
        .read(
          key: _keyType,
          mOptions: macOsOptions,
        )
        .then((value) => value ?? "${BackupType.disk.index}")
        .then((value) => int.parse(value))
        .then((value) => BackupType.values[value]);
    var config = await storage
        .read(
          key: _keyConfig,
          mOptions: macOsOptions,
        )
        .then((value) => value ?? "{}")
        .then((value) => jsonDecode(value));
    emit(state.copyWith(type: type, config: config));
  }

  setConfig(Map<String, dynamic> config) async {
    emit(state.copyWith(config: HashMap.from(config)));
  }

  setType(BackupType type) async {
    emit(state.copyWith(type: type));
  }

  Future<void> flush() async {
    await storage.write(
      key: _keyType,
      value: "${state.type.index}",
      mOptions: macOsOptions,
    );

    await storage.write(
      key: _keyConfig,
      value: jsonEncode(state.config),
      mOptions: macOsOptions,
    );
    var config = await storage
        .read(
          key: _keyConfig,
          mOptions: macOsOptions,
        )
        .then((value) => value ?? "{}")
        .then((value) => jsonDecode(value));
  }

  @override
  Future<void> export() async {
    for (var value in _backupAdapters) {
      if (value.supportType == state.type) {
        return await value.export();
      }
    }
  }

  @override
  Future<void> import() async {
    for (var value in _backupAdapters) {
      if (value.supportType == state.type) {
        return await value.import();
      }
    }
  }

  @override
  BackupType get supportType => throw UnimplementedError();
}
