import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/di/di.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/ssh_config_bloc.dart';
import '../theme/app_theme.dart';
import 'hosts/add_host_page.dart';
import 'hosts/list_host_page.dart';
import 'package:flutter_gen/gen_l10n/SS.dart';

class BackupRestorePage extends StatelessWidget with AppThemeData {
  const BackupRestorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var configState = context.watch<AppConfigCubit>().state;
    var locale = configState.locale;

    var colors = context.watch<AppConfigCubit>().state.currentColor;
    return MaterialApp(
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
      home: Scaffold(
        body: Column(
          children: [
            MaterialButton(
              onPressed: () {
                var bloc = getIt<SshConfigBloc>();
                bloc.export().then((configs) async {
                  var saveFile = await FilePicker.platform.saveFile(
                    dialogTitle: "导出到...",
                    fileName: "fterm_export.json",
                    initialDirectory: Platform.environment['HOME'] ??
                        Platform.environment['USERPROFILE'],
                  );
                  if (saveFile != null) {
                    File(saveFile).writeAsString(jsonEncode(configs));
                  }
                  return saveFile;
                });
              },
              child: const Text("导出"),
            ),
          ],
        ),
      ),
    );
  }
}
