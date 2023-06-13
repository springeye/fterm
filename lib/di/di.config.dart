// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/backup_cubit.dart' as _i8;
import '../bloc/profiles_search_cubit.dart' as _i5;
import '../bloc/ssh_config_bloc.dart' as _i6;
import '../bootstrap/runner.dart' as _i3;
import '../db/database.dart' as _i7;
import '../db/ssh_config_dao.dart' as _i9;
import 'register_modules.dart' as _i10;

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
    gh.singleton<_i4.FlutterSecureStorage>(
        registerModule.provideFlutterSecureStorage);
    gh.singleton<_i5.ProfilesSearchCubit>(_i5.ProfilesSearchCubit());
    gh.singleton<_i6.SshConfigBloc>(_i6.SshConfigBloc());
    await gh.singletonAsync<String>(
      () => registerModule.provideEncryptionKey,
      instanceName: 'encryptionKey',
      preResolve: true,
    );
    await gh.singletonAsync<_i7.AppDatabase>(
      () => _i7.AppDatabase.from(gh<String>(instanceName: 'encryptionKey')),
      preResolve: true,
    );
    gh.singleton<_i8.BackupCubit>(
        _i8.BackupCubit(gh<_i4.FlutterSecureStorage>()));
    gh.singleton<_i9.SSHConfigDao>(
        registerModule.provideSSHConfigDao(gh<_i7.AppDatabase>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
