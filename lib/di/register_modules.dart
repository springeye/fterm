import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../model/ssh_config.dart';

@module
abstract class RegisterModule {
  @singleton
  FlutterSecureStorage get provideFlutterSecureStorage {
    const secureStorage = FlutterSecureStorage();
    return secureStorage;
  }

  @singleton
  @preResolve
  Future<Box<SSHConfig>> get providerBox async {
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final encryptionKeyString = await secureStorage.read(key: 'hive');
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: 'hive',
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(key: 'hive');
    final encryptionKeyUint8List = base64Url.decode(key!);
    print('Encryption key Uint8List: $encryptionKeyUint8List');

    var box = await Hive.openBox<SSHConfig>('ssh',
        encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    // await box.clear();
    return box;
  }
}
