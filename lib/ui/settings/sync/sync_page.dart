import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/di/di.dart';

import '../../../bloc/app_config_cubit.dart';
import '../../../service/sync_service.dart';
import '../../theme/app_theme.dart';

class SyncPage extends StatelessWidget with AppThemeData {
  const SyncPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = context.watch<AppConfigCubit>().state.currentColor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: materialTheme(context, colors),
      home: Scaffold(
        body: Button(
            child: Text("同步"),
            onPressed: () async {
              var service=getIt<SyncService>();
              await service.pull();
            }),
      ),
    );
  }
}
