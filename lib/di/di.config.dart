// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/profiles_search_cubit.dart' as _i7;
import '../bloc/ssh_config_bloc.dart' as _i8;
import '../bootstrap/runner.dart' as _i3;
import '../model/ssh_config.dart' as _i5;
import '../service/sync_service.dart' as _i9;
import '../service/webdav_sync_service.dart' as _i10;
import 'register_modules.dart' as _i11;

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
    await gh.singletonAsync<_i4.Box<_i5.SSHConfig>>(
      () => registerModule.providerBox,
      preResolve: true,
    );
    gh.singleton<_i6.FlutterSecureStorage>(
        registerModule.provideFlutterSecureStorage);
    gh.singleton<_i7.ProfilesSearchCubit>(_i7.ProfilesSearchCubit());
    gh.singleton<_i8.SshConfigBloc>(_i8.SshConfigBloc());
    gh.singleton<_i9.SyncService>(
        _i10.WebDAVSyncService(gh<_i6.FlutterSecureStorage>())..init());
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
