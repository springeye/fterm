import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/ssh_config_bloc.dart';

class HostListPage extends StatelessWidget {
  const HostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.watch<SshConfigBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text("主机列表"),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context).pushNamed("/add");
                context.push("/add");
                // context.go("/add")
              },
              icon: const Icon(
                Icons.add,
                size: 28,
              ))
        ],
      ),
      body: ListView(
        children: [
          ...state.configs.map(
            (e) => ListTile(
              onTap: () {
                context.push(
                  "/add",
                  extra: e,
                );
              },
              leading: const Icon(Icons.computer),
              title: Text(e.title),
              subtitle: Text("${e.username}@${e.host}:${e.port}"),
            ),
          ),
        ],
      ),
    );
  }
}
