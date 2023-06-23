import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:fterm/gen/assets.gen.dart';

import '../../model/shell.dart';
import 'connector.dart';
import 'plugin.dart';

class LocalConnector extends Connector {
  final Shell? shell;

  LocalConnector({this.shell});

  late Pty _pty;

  String? get _userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];
  final _outputController = StreamController<Uint8List>();
  final _exitCode = StreamController<int>();
  final _stdinController = StreamController<Uint8List>();

  String get executable => shell?.title ?? shell?.cmd ?? defaultShell;

  @override
  Future<void> connect() async {
    debugPrint("LocalConnector==>${shell.toString()}");
    _pty = Pty.start(
      executable,
      arguments: shell?.args ?? [],
      workingDirectory: _userHome,
      environment: Platform.isWindows ? Map.from(Platform.environment) : null,
      columns: 100,
      rows: 100,
      ackRead: false,
    );
    _outputController.addStream(_pty.output);
    _stdinController.stream.listen(_pty.write);
    _exitCode.addStream(_pty.exitCode.asStream());

    // _exitCode.stream.listen((event) {
    //   _stdinController.close();
    //   _stdinController.close();
    //   _outputController.close();
    // });
  }

  @override
  Stream<Uint8List> get output => _outputController.stream;

  @override
  StreamSink<Uint8List> get input => _stdinController.sink;

  @override
  Future<int> get exitCode => _exitCode.stream.first;

  @override
  void write(Uint8List data) {
    _pty.write(data);
  }

  String get defaultShell {
    if (Platform.isMacOS || Platform.isLinux) {
      return Platform.environment['SHELL'] ?? 'bash';
    }

    if (Platform.isWindows) {
      if (Process.runSync("where", ["pwsh.exe"]).exitCode == 0) {
        return 'pwsh.exe';
      }
      return 'powershell.exe';
    }

    return 'sh';
  }

  @override
  void resize(width, height, pixelWidth, pixelHeight) {
    _pty.resize(width, height);
  }

  @override
  bool get isRemote => false;

  @override
  String get title => executable;

  @override
  Widget? get icon {
    if (shell?.icon != null) {
      return shell?.icon;
    } else {
      if (Platform.isWindows) {
        return Assets.icons.powershell.svg(width: 16, height: 16);
      }
    }
    return null;
  }

  @override
  Future<void> dispose() async {
    _pty.kill(ProcessSignal.sigkill);
  }

  @override
  List<Plugin> get futures => [];
}
