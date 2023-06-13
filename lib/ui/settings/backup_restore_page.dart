import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
                bloc.export().then((content) async {
                  var saveFile = await FilePicker.platform.saveFile(
                    dialogTitle: "导出到...",
                    fileName: "fterm_export.ft",
                    initialDirectory: Platform.environment['HOME'] ??
                        Platform.environment['USERPROFILE'],
                  );
                  if (saveFile != null) {
                    File(saveFile).writeAsString(content).then((value) {
                      EasyLoading.showSuccess("导出成功");
                    }).catchError((e) {
                      EasyLoading.showError("导出失败");
                    });
                  }
                  return saveFile;
                });
              },
              child: const Text("导出"),
            ),
            MaterialButton(
              onPressed: () async {
                var bloc = getIt<SshConfigBloc>();
                var file = (await FilePicker.platform.pickFiles(
                  dialogTitle: "导出到...",
                  allowedExtensions: ["ft"],
                  initialDirectory: Platform.environment['HOME'] ??
                      Platform.environment['USERPROFILE'],
                ))
                    ?.files
                    .firstOrNull;
                if (file != null) {
                  File(file.path!).readAsString().then((baseContent) {
                    bloc.import(baseContent);
                    EasyLoading.showSuccess("导入成功");
                  }).catchError((e) {
                    EasyLoading.showError("导入失败");
                  });
                }
              },
              child: const Text("导入"),
            ),
          ],
        ),
      ),
    );
  }
}
