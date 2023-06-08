// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:fterm/db/database.dart';
import 'package:injectable/injectable.dart';

import '../model/ssh_config.dart';

@dao
abstract class SSHConfigDao {
  @Query('SELECT * FROM SSHConfig')
  Future<List<SSHConfig>> findAllSSHConfig();

  @Query('SELECT * FROM SSHConfig WHERE id = :id')
  Future<SSHConfig?> findSSHConfigById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addSSHConfig(SSHConfig config);
}
