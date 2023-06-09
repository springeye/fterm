// database.dart

// required package imports
import 'dart:async';
import 'dart:io';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite;
import 'package:sqflite_common/sqflite.dart' hide Database;
import '../model/ssh_config.dart';
import 'ssh_config_dao.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';
part 'database.g.dart'; // the generated code will be there
final DatabaseFactory sqfliteDatabaseFactory = () {
  if (Platform.isAndroid || Platform.isIOS) {
    if(Platform.isAndroid){
      open.overrideFor(
          OperatingSystem.android, openCipherOnAndroid);
    }
    return databaseFactory;
  } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    return sqflite.databaseFactoryFfi;
  } else {
    throw UnsupportedError(
      'Platform ${Platform.operatingSystem} is not supported by Floor.',
    );
  }
}();

@singleton
@Database(version: 1, entities: [SSHConfig])
abstract class AppDatabase extends FloorDatabase {
  @factoryMethod
  @preResolve
  static Future<AppDatabase> from(@Named("encryptionKey") String key) async {
    var path =
        await getApplicationSupportDirectory().then((value) => value.path);
    var builder = $FloorAppDatabase.databaseBuilder('$path/app_database.db');
    return await builder.addCallback(
      Callback(
        onConfigure: (db) async {
          print("db path=>>${db.path}");
          var cipherVersion = await db.rawQuery("PRAGMA cipher_version");
          if (cipherVersion.isEmpty) {
            throw StateError(
                'SQLCipher library is not available, please check your dependencies!');
          }
          debugPrint(cipherVersion.toString());
          db.execute("PRAGMA key = '$key';");
        },
      ),
    ).build();
  }

  SSHConfigDao get configDao;
}
