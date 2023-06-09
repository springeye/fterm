import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fterm/bloc/ssh_config_bloc.dart';
import 'package:fterm/di/di.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../widget/radio.dart';
import 'package:flutter_gen/gen_l10n/SS.dart';

class AddHostPage extends StatefulWidget {
  final SSHConfig? config;

  const AddHostPage({Key? key, this.config}) : super(key: key);

  @override
  State<AddHostPage> createState() => _AddHostPageState();
}

class _PortTextInputFormatter extends TextInputFormatter {
  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (!isNumeric(newValue.text)) {
      return oldValue;
    }
    var i = int.parse(newValue.text);
    if (i > 0 && i <= 65535) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}

class _AddHostPageState extends State<AddHostPage> {
  AuthType _authType = AuthType.auto;
  ConnectType _connectType = ConnectType.direct;
  final TextEditingController _keyController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  late SSHConfig config;

  @override
  void initState() {
    config = widget.config ??
        SSHConfig(
            id: const Uuid().v4().toString(),
            title: "",
            host: "",
            username: "",
            port: 22);
    _keyController.text = config.privateKey ?? "";
    if (config.jumpServer != null || config.jumpServer?.isNotEmpty == true) {
      _connectType = ConnectType.proxy;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hosts = context.watch<SshConfigBloc>().state.configs;
    var ss = SS.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.config == null ? ss.add_host : ss.edit_host),
        actions: [
          IconButton(
              onPressed: () {
                if (_globalKey.currentState?.validate() == true) {
                  _globalKey.currentState?.save();
                  getIt<SshConfigBloc>().add(SshConfigEvent.add(config));
                  context.pop();
                }
              },
              icon: const Icon(
                Icons.save,
                size: 28,
              ))
        ],
      ),
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    child: Row(
                      children: [
                        Text(ss.connect_type),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: RadioFormGroup<ConnectType>(
                            _connectType,
                            onChanged: (value) {
                              //rebuild current form field
                              setState(() {
                                _connectType = value ?? ConnectType.direct;
                              });
                            },
                            items: [
                              RadioItem<ConnectType>(
                                ConnectType.direct,
                                title: Text(ss.direct),
                              ),
                              RadioItem<ConnectType>(
                                ConnectType.proxy,
                                title: Text(ss.proxy),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                if (_connectType == ConnectType.proxy)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField<String>(
                      value: config.jumpServer,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: ss.proxy_host,
                      ),
                      items: hosts
                          .map((e) => DropdownMenuItem<String>(
                                value: e.id,
                                child: Text(
                                    "${e.title}(${e.username}@${e.host}:${e.port})"),
                              ))
                          .toList(),
                      onChanged: (String? value) {},
                      validator: (v) {
                        if (_connectType == ConnectType.proxy) {
                          if (v == null || v.isEmpty) {
                            return ss.required_field(ss.proxy_host);
                          }
                        }
                        return null;
                      },
                      onSaved: (v) {
                        if (_connectType == ConnectType.proxy) {
                          config.jumpServer = v!;
                        } else {
                          config.jumpServer = null;
                        }
                      },
                    ),
                  ),
                TextFormField(
                  initialValue: config.title,
                  decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: ss.title,
                  ),
                  onSaved: (v) => config.title = v!,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: config.host,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            isDense: true,
                            hintText: "192.168.1.1",
                            border: const OutlineInputBorder(),
                            labelText: ss.host,
                          ),
                          validator: (v) {
                            if (v?.isEmpty == true) {
                              return ss.required_field(ss.host);
                            }
                            return null;
                          },
                          onSaved: (v) => config.host = v!,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        width: 85,
                        child: TextFormField(
                          initialValue: "${config.port}",
                          inputFormatters: [
                            _PortTextInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            hintText: "22",
                            labelText: ss.port,
                          ),
                          onSaved: (v) => config.port = int.tryParse(v!) ?? 0,
                          validator: (v) {
                            if (v?.isEmpty == true) {
                              return ss.required_field(ss.port);
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    initialValue: config.username,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: "root",
                      labelText: ss.username,
                    ),
                    onSaved: (v) => config.username = v!,
                    validator: (v) {
                      if (v?.isEmpty == true) {
                        return ss.required_field(ss.username);
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 1),
                    child: Row(
                      children: [
                        Text(ss.auth_type),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: RadioFormGroup<AuthType>(
                            config.authType,
                            onChanged: (value) {
                              //rebuild current form field
                              setState(() {
                                _authType = value ?? AuthType.auto;
                              });
                            },
                            onSaved: (v) {
                              config.authType = v!;
                            },
                            items: [
                              RadioItem<AuthType>(
                                AuthType.auto,
                                title: Text(ss.auto),
                              ),
                              RadioItem<AuthType>(
                                AuthType.password,
                                title: Text(ss.password),
                              ),
                              RadioItem<AuthType>(
                                AuthType.key,
                                title: Text(ss.secret_key),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                if (_authType == AuthType.auto ||
                    _authType == AuthType.password)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      obscureText: true,
                      initialValue: config.password,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        isDense: true,
                        border: const OutlineInputBorder(),
                        labelText: ss.password,
                      ),
                      onChanged: (v) => config.password = v,
                      validator: (v) {
                        if ((config.password == null ||
                                config.password?.isEmpty == true) &&
                            (config.privateKey == null ||
                                config.privateKey?.isEmpty == true)) {
                          return ss.auth_type_error;
                        }
                        return null;
                      },
                    ),
                  ),
                if (_authType == AuthType.auto || _authType == AuthType.key)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child: TextFormField(
                        onChanged: (v) => config.privateKey = v,
                        validator: (v) {
                          if ((config.password == null ||
                                  config.password?.isEmpty == true) &&
                              (config.privateKey == null ||
                                  config.privateKey?.isEmpty == true)) {
                            return ss.auth_type_error;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        minLines: 10,
                        controller: _keyController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          isDense: true,
                          border: const OutlineInputBorder(),
                          labelText: ss.secret_key,
                          hintText: ss.select_key_hint,
                        ),
                        contextMenuBuilder: (BuildContext context,
                            EditableTextState editableTextState) {
                          final TextEditingValue value =
                              editableTextState.textEditingValue;
                          final List<ContextMenuButtonItem> buttonItems =
                              editableTextState.contextMenuButtonItems;

                          buttonItems.insert(
                              0,
                              ContextMenuButtonItem(
                                label: '选择文件',
                                onPressed: () async {
                                  ContextMenuController.removeAny();
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    dialogTitle: "选择秘钥",
                                    initialDirectory:
                                        Platform.environment['HOME'] ??
                                            Platform.environment['USERPROFILE'],
                                  );
                                  if (result != null) {
                                    File file = File(result.files.first.path!);
                                    var keyBody = await file.readAsString();
                                    _keyController.text = keyBody;
                                  } else {
                                    print("取消了选择");
                                  }
                                },
                              ));
                          return AdaptiveTextSelectionToolbar.buttonItems(
                            anchors: editableTextState.contextMenuAnchors,
                            buttonItems: buttonItems,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
