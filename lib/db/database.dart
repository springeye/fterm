// database.dart

// required package imports
import 'dart:async';
import 'dart:io';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite;

import '../model/ssh_config.dart';
import 'ssh_config_dao.dart';
// import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

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
