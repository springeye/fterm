import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fterm/bootstrap/runner.dart';

import '../../gen/assets.gen.dart';
import 'package:path/path.dart' as path;

class LauncherScriptTask extends LaunchTask {
  @override
  Future<void> initialize(LaunchContext context) async {
    debugPrint("LauncherScriptTask");
    if (shellPath.isNotEmpty) {
      if (Platform.isMacOS || Platform.isLinux) {
        Process.runSync("chmod", ["+x", shellPath]);
      }
      var list = Platform.environment["PATH"]?.split(":") ?? [];
      for (var p in list) {
        if (!path.split(p).contains("bin")) continue;
        try {
          var link = Link("$p/fterm");
          if (link.existsSync()) {
            await link.update(shellPath);
            print("update link $shellPath ==> ${link.path} success");
          } else {
            await link.create(shellPath);
            print("create link $shellPath ==> ${link.path} success");
          }

          break;
        } catch (e) {
          // print(e);
        }
      }
    }
  }
}

String get shellPath {
  if (Platform.isLinux) {
    String dir = Platform.resolvedExecutable;
    return path.normalize(
      path.join(
        dir,
        "../",
        "data/flutter_assets",
        Assets.scripts.linux.fterm,
      ),
    );
  }
  if (Platform.isMacOS) {
    String dir = Platform.resolvedExecutable;
    return path.normalize(
      path.join(
        dir,
        "../..",
        "Frameworks/App.framework/Versions/Current/Resources/flutter_assets",
        Assets.scripts.macos.fterm,
      ),
    );
  }
  return "";
}
