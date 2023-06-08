import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fterm/db/ssh_config_dao.dart';
import 'package:fterm/service/sync_service.dart';
import 'package:injectable/injectable.dart';
import 'package:webdav_client/webdav_client.dart';

import '../di/di.dart';
import '../model/ssh_config.dart';

@Singleton(as: SyncService)
class WebDAVSyncService extends SyncService {
  final FlutterSecureStorage storage;

  WebDAVSyncService(this.storage);

  Future<Client?> get _client async {
    String? webdav = await storage.read(key: "webdav");
    if (webdav == null) {
      return null;
    }
    Map<String, String> config = jsonDecode(webdav);
    var client = newClient(
      config['url']!,
      user: config['username']!,
      password: config['password']!,
      debug: true,
    );

    // Set the public request headers
    client.setHeaders({'accept-charset': 'utf-8'});

    // Set the connection server timeout time in milliseconds.
    client.setConnectTimeout(5000);

    // Set send data timeout time in milliseconds.
    client.setSendTimeout(5000);

    // Set transfer data time in milliseconds.
    client.setReceiveTimeout(5000);

    // Test whether the service can connect
    try {
      await client.ping();
    } catch (e) {
      print('$e');
    }
    return client;
  }

  @PostConstruct()
  void init() {}

  @override
  Future<void> push() async {
    var box = getIt<SSHConfigDao>();
    var client = await _client;
    if (client == null) return;
    await client.mkdirAll("fterm/backup/");
    var map = await box.findAllSSHConfig();
    client.write("backup-${DateTime.now().millisecondsSinceEpoch}",
        Uint8List.fromList(jsonEncode(map).codeUnits));
  }

  @override
  Future<void> pull() async {
    var client = await _client;
    if (client == null) return;

    await client.mkdirAll("fterm/backup/");
    var files = await client
        .readDir("fterm/backup/")
        .then((value) => value.where((element) => !(element.isDir ?? false)));
    files.forEach((element) {
      print(element);
    });
    print("read list");
    // var data = await client.read("fterm.backup");
    // var items = jsonDecode(String.fromCharCodes(data)) as Map<dynamic, dynamic>;
    // var data2 = items.map((key, value) {
    //   var config = SSHConfig.fromJson(value);
    //   return MapEntry(config.id, config);
    // });
    // box.putAll(data2);
  }
}
