// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/backup_cubit.dart' as _i11;
import '../bloc/shells_cubit.dart' as _i8;
import '../bloc/ssh_config_bloc.dart' as _i9;
import '../bootstrap/runner.dart' as _i3;
import '../db/database.dart' as _i10;
import '../db/ssh_config_dao.dart' as _i12;
import '../service/backup_restore_adapter.dart' as _i4;
import '../service/impl/local_backup_restore_adapter.dart' as _i5;
import '../service/impl/webdav_backup_restore_adapter.dart' as _i6;
import 'register_modules.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppLauncher>(_i3.AppLauncher());
    gh.singleton<_i4.BackupStoreAdapter>(
      _i5.LocalBackupStoreAdapter(),
      instanceName: 'local',
    );
    gh.singleton<_i4.BackupStoreAdapter>(
      _i6.WebDAVBackupStoreAdapter(),
      instanceName: 'webdav',
    );
    gh.singleton<_i7.FlutterSecureStorage>(
        registerModule.provideFlutterSecureStorage);
    gh.singleton<_i8.ProfilesSearchCubit>(_i8.ProfilesSearchCubit());
    gh.singleton<_i9.SshConfigBloc>(_i9.SshConfigBloc());
    await gh.singletonAsync<String>(
      () => registerModule.provideEncryptionKey,
      instanceName: 'encryptionKey',
      preResolve: true,
    );
    await gh.singletonAsync<_i10.AppDatabase>(
      () => _i10.AppDatabase.from(gh<String>(instanceName: 'encryptionKey')),
      preResolve: true,
    );
    gh.singleton<_i11.BackupCubit>(
        _i11.BackupCubit(gh<_i7.FlutterSecureStorage>()));
    gh.singleton<_i12.SSHConfigDao>(
        registerModule.provideSSHConfigDao(gh<_i10.AppDatabase>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
