import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bloc/ssh_config_bloc.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:uuid/uuid.dart';

class SSHPage extends StatefulWidget {
  final SSHConfig? config;

  const SSHPage({Key? key, this.config}) : super(key: key);

  @override
  State<SSHPage> createState() => _SSHPageState();
}

class _SSHPageState extends State<SSHPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  SSHConfig get _config =>
      widget.config ??
      SSHConfig(
          id: const Uuid().v4().toString(), title: "", host: "", username: "");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: _config.title,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.title),
                        hintText: '输入配置名',
                        labelText: '名字',
                      ),
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return "配置名不能为空";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _config.title = v ?? "";
                      },
                    ),
                    TextFormField(
                      initialValue: _config.host,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.link),
                        hintText: '输入域名或IP,如 192.168.50.1',
                        labelText: '地址',
                      ),
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return "地址不能为空";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _config.host = v ?? "";
                      },
                    ),
                    TextFormField(
                      initialValue: _config.username,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.link),
                        hintText: '登录用户名',
                        labelText: '用户名',
                      ),
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return "用户名不能为空";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _config.username = v ?? "";
                      },
                    ),
                    TextFormField(
                      initialValue: _config.password,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.link),
                        hintText: '登录密码',
                        labelText: '密码',
                      ),
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return "密码不能为空";
                        }
                        return null;
                      },
                      onSaved: (v) {
                        _config.password = v;
                      },
                    ),
                    // 登录按钮
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text("保存"),
                              ),
                              onPressed: () {
                                var formState =
                                    _formKey.currentState as FormState;
                                if ((formState).validate()) {
                                  formState.save();
                                  context
                                      .read<SshConfigBloc>()
                                      .add(SshConfigEvent.add(_config));
                                  //验证通过提交数据
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
