import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:webdav_client/webdav_client.dart';

import '../../bloc/backup_cubit.dart';
import '../../bloc/ssh_config_bloc.dart';
import '../../di/di.dart';
import '../../model/backup_type.dart';
import '../backup_restore_adapter.dart';

@Singleton(as: BackupStoreAdapter)
@Named("webdav")
class WebDAVBackupStoreAdapter implements BackupStoreAdapter {
  Future<Client> getWebDAVClient() async {
    var state = getIt<BackupCubit>().state;
    var config = state.config;
    var client = newClient(
      config['host']!,
      user: config['username']!,
      password: config['password']!,
      debug: kDebugMode,
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

  @override
  Future<void> export() {
    debugPrint("WebDAVBackupStoreAdapter.export");
    var bloc = getIt<SshConfigBloc>();
    return bloc.export().then((content) async {
      var client = await getWebDAVClient();
      await client.write(
          "fterm_export.ft", Uint8List.fromList(content.codeUnits));
    });
  }

  @override
  Future<void> import() async {
    debugPrint("WebDAVBackupStoreAdapter.import");
    var bloc = getIt<SshConfigBloc>();
    var client = await getWebDAVClient();
    var content = await client.read("fterm_export.ft");
    bloc.import(String.fromCharCodes(content));
  }

  @override
  BackupType get supportType => BackupType.webdav;
}
