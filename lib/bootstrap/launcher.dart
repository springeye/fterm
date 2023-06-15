import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/bloc/backup_cubit.dart';
import 'package:fterm/bloc/shells_cubit.dart';
import 'package:fterm/di/di.dart';
import 'package:statsfl/statsfl.dart';

import '../bloc/home_tab_bloc.dart';
import '../bloc/ssh_config_bloc.dart';
import '../ui/term_app.dart';
import 'options.dart';
import 'runner.dart';

class Launcher implements EntryPoint {
  @override
  Widget create(LaunchOptions options) {
    var app = const TermApp();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppConfigCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeTabBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SshConfigBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfilesSearchCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<BackupCubit>(),
        ),
      ],
      child: Builder(builder: (context) {
        return BlocListener<SshConfigBloc, SshConfigState>(
          listener: (context, state) {
            getIt<ProfilesSearchCubit>().load();
          },
          child: BlocBuilder<AppConfigCubit, AppConfigState>(
            builder: (context, state) {
              return StatsFl(
                align: Alignment.topCenter,
                maxFps: 60,
                isEnabled: kDebugMode && state.showFPS,
                child: app,
              );
            },
          ),
        );
      }),
    );
  }
}
