import 'dart:async';
import 'dart:typed_data';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fterm/db/ssh_config_dao.dart';
import 'package:fterm/di/di.dart';
import 'package:fterm/model/ssh_config.dart';
import 'package:fterm/ui/connector/connector.dart';
import 'package:fterm/ui/connector/plugin.dart';

class SSHConnector extends Connector {
  final SSHConfig config;

  SSHConnector(this.config);

  final _outputController = StreamController<Uint8List>();
  late SSHSession _session;
  SSHClient? _jmpServer;
  late SSHClient _client;

  @override
  Future<void> connect() async {
    SSHSocket sshSocket;
    var box = getIt<SSHConfigDao>();
    var jumpServerId = config.jumpServer;
    SSHConfig? jumpServer =
        jumpServerId == null ? null : await box.findSSHConfigById(jumpServerId);
    if (jumpServer != null) {
      _jmpServer =
          await SSHSocket.connect(jumpServer.host, jumpServer.port).then(
        (jmpSocket) => SSHClient(
          jmpSocket,
          username: jumpServer.username,
          identities: [
            ...(jumpServer.privateKey != null &&
                    jumpServer.privateKey!.trim().isNotEmpty
                ? SSHKeyPair.fromPem(
                    jumpServer.privateKey!.trim(),
                    jumpServer.passphrase,
                  )
                : [])
          ],
          onPasswordRequest: () => jumpServer.password,
        ),
      );
      sshSocket = await _jmpServer!.forwardLocal(config.host, config.port);
    } else {
      sshSocket = await SSHSocket.connect(config.host, config.port);
    }

    _client = SSHClient(
      sshSocket,
      username: config.username,
      identities: [
        ...(config.privateKey != null && config.privateKey!.trim().isNotEmpty
            ? SSHKeyPair.fromPem(
                config.privateKey!.trim(),
                config.passphrase,
              )
            : [])
      ],
      onPasswordRequest: () => config.password,
    );
    _session = await _client.shell(
      pty: const SSHPtyConfig(
        width: 100,
        height: 100,
      ),
    );
    _session.stdout.pipe(_outputController.sink);
    // _outputController.addStream(_session.stdout);
  }

  @override
  Stream<Uint8List> get output => _outputController.stream;

  @override
  StreamSink<Uint8List> get input => _session.stdin;

  @override
  Future<int> get exitCode => _session.done.then((value) {
        return _session.exitCode ?? -99999;
      });

  @override
  void write(Uint8List data) {
    _outputController.add(data);
  }

  @override
  void resize(width, height, pixelWidth, pixelHeight) {
    _session.resizeTerminal(width, height, pixelWidth, pixelHeight);
  }

  @override
  bool get isRemote => true;

  @override
  String get title => config.title;

  @override
  Widget? get icon => null;

  @override
  Future<void> dispose() async {
    _session.kill(SSHSignal.KILL);
    _client.close();
    _jmpServer?.close();
    _outputController.close();
  }

  @override
  List<Plugin> get futures => [Plugin.zModel];
}
