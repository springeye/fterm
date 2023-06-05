import 'package:flutter/material.dart';

class Shell {
  final String title;
  final String cmd;
  final List<String>? args;
  final Map<String, String>? envs;
  final Widget? icon;

  Shell(this.title, this.cmd, {this.icon, this.args, this.envs});

  @override
  String toString() {
    return 'Shell{title: $title, cmd: $cmd, args: $args, envs: $envs}';
  }
}
