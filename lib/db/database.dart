// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite;
// import 'package:sqflite/sqflite.dart' as sqflite;

import 'person.dart';
import 'person_dao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}
