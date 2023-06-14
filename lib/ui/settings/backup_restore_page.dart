import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/bloc/backup_cubit.dart';
import 'package:fterm/di/di.dart';
import 'package:fterm/model/backup_type.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:fterm/service/backup_restore_adapter.dart';
import 'package:fterm/service/impl/webdav_backup_restore_adapter.dart';
import 'package:fterm/ui/widget/radio.dart';
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
      home: _Form(),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackupCubit, BackupState>(
      builder: (context, state) {
        Map<String, dynamic> configs = HashMap.from(state.config);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () async {
                    try {
                      if (_globalKey.currentState?.validate() == true) {
                        var bloc = getIt<BackupCubit>();
                        await bloc.setConfig(configs);
                        if (state.type == BackupType.webdav) {
                          EasyLoading.show(status: 'Test webdav server...');
                          var client = await getIt<WebDAVBackupStoreAdapter>()
                              .getWebDAVClient();
                          await client.ping();
                        }
                        await bloc.flush();
                        EasyLoading.showSuccess("保存成功");
                      }
                    } catch (e) {
                      EasyLoading.showError(e.toString());
                    }
                  },
                  icon: const Icon(Icons.save))
            ],
          ),
          body: Form(
            key: _globalKey,
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        const Text("目的地: "),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: RadioFormGroup<BackupType>(
                            state.type,
                            items: const [
                              RadioItem(
                                BackupType.disk,
                                title: Text("本地"),
                              ),
                              RadioItem(
                                BackupType.webdav,
                                title: Text("WebDAV"),
                              ),
                            ],
                            onChanged: (v) async {
                              var bloc = getIt<BackupCubit>();
                              await bloc.setType(v!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.type == BackupType.webdav)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        initialValue: configs["host"],
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          isDense: true,
                          hintText: "https://example.com/backup/",
                          border: const OutlineInputBorder(),
                          labelText: "地址",
                        ),
                        onChanged: (v) {
                          configs["host"] = v;
                        },
                      ),
                    ),
                  if (state.type == BackupType.webdav)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        initialValue: configs["username"],
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          isDense: true,
                          hintText: "admin",
                          border: const OutlineInputBorder(),
                          labelText: "用户名",
                        ),
                        onChanged: (v) {
                          configs["username"] = v;
                        },
                      ),
                    ),
                  if (state.type == BackupType.webdav)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        initialValue: configs["password"],
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          isDense: true,
                          hintText: "test111",
                          border: const OutlineInputBorder(),
                          labelText: "密码",
                        ),
                        onChanged: (v) {
                          configs["password"] = v;
                        },
                      ),
                    ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, right: 80, left: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            getIt<BackupCubit>().export().then((value) {
                              EasyLoading.showSuccess("导出成功");
                            }).catchError((e) {
                              EasyLoading.showSuccess("导出失败");
                            });
                          },
                          child: const Text("导出"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            getIt<BackupCubit>().import().then((value) {
                              EasyLoading.showSuccess("导入成功");
                            }).catchError((e) {
                              EasyLoading.showSuccess("导入失败");
                            });
                          },
                          child: const Text("导入"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text("注意：导入数据的时候，将会完成合并覆盖现有数据"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
