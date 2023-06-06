import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import 'hosts/add_host_page.dart';
import 'hosts/list_host_page.dart';
import 'package:flutter_gen/gen_l10n/SS.dart';

class HostPage extends StatelessWidget with AppThemeData {
  const HostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var configState = context.watch<AppConfigCubit>().state;
    var locale = configState.locale;
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: "/",
          builder: (context, state) => const HostListPage(),
        ),
        GoRoute(
          path: '/add',
          name: "/add",
          builder: (context, state) {
            var config = state.extra as SSHConfig?;
            return AddHostPage(
              config: config,
            );
          },
        ),
      ],
    );
    var colors = context.watch<AppConfigCubit>().state.currentColor;
    return MaterialApp.router(
      localizationsDelegates: const [
        SS.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: SS.supportedLocales,
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme: materialTheme(context, colors),
      routerConfig: router,
    );
  }
}
