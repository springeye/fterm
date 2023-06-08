import 'dart:convert';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fterm/db/database.dart';
import 'package:fterm/db/ssh_config_dao.dart';
import 'package:fterm/utils/ext.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  FlutterSecureStorage get provideFlutterSecureStorage {
    const secureStorage = FlutterSecureStorage();
    return secureStorage;
  }

  @singleton
  @preResolve
  @Named("encryptionKey")
  Future<String> get provideEncryptionKey async {
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final encryptionKeyString = await secureStorage.read(key: 'encryptionKey');
    if (encryptionKeyString == null) {
      final key = Random.secure().nextBytes(128);
      await secureStorage.write(
        key: 'encryptionKey',
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: 'encryptionKey');
    print(key);
    return key!;
  }

  @singleton
  SSHConfigDao provideSSHConfigDao(AppDatabase db) {
    return db.configDao;
  }
}
