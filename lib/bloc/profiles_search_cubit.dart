import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fterm/di/di.dart';
import 'package:fterm/gen/assets.gen.dart';
import 'package:injectable/injectable.dart';
import '../db/ssh_config_dao.dart';
import '../model/shell.dart';
import '../model/ssh_config.dart';

part 'profiles_search_state.dart';

part 'profiles_search_cubit.freezed.dart';

@singleton
class ProfilesSearchCubit extends Cubit<ProfilesState> {
  ProfilesSearchCubit()
      : super(const ProfilesState.initial(
            [Item.hosts("主机", true, []), Item.shells("本地", true, [])], "")) {}

  @override
  Future<void> close() {
    return super.close();
  }

  void expanded(int index, bool isExpanded) {
    var items = List.of(state.items);
    items[index] = items[index].copyWith(isExpanded: isExpanded);
    emit(state.copyWith(items: items));
  }

  Future<void> load() async {
    var dao = getIt<SSHConfigDao>();
    var hosts = await dao.findAllSSHConfig();
    var shells = await _shells();
    emit(state.copyWith(
      items: [
        ...state.items.map((e) {
          return e.map(hosts: (item) {
            return item.copyWith(hosts: hosts);
          }, shells: (item) {
            return item.copyWith(shells: shells);
          });
        })
      ],
    ));
  }

  Future<List<Shell>> _shells() async {
    if (Platform.isMacOS || Platform.isLinux) {
      var shells = await File("/etc/shells").readAsLines();
      shells = shells
          .skipWhile((value) => value.startsWith("#") || value.trim().isEmpty)
          .toList();
      return shells.map((e) => Shell(e, e)).toList();
    } else if (Platform.isWindows) {
      return [
        Shell(
          "cmd",
          "cmd.exe",
          icon: Assets.icons.cmd.svg(width: 16, height: 16),
        ),
        Shell(
          "Powershell",
          "powershell.exe",
          icon: Assets.icons.powershell.svg(width: 16, height: 16),
        )
      ];
      if (Process.runSync("where", ["wsl.exe"]).exitCode == 0) {
        ProcessResult result = await Process.run("wsl", ['-l', '-q']);
        List<String> distros = const LineSplitter()
            .convert(result.stdout)
            .map((e) => String.fromCharCodes(
                e.codeUnits.where((element) => element > 0)))
            .where((element) => element.isNotEmpty)
            .toList();
        // return distros.map((e) => Shell(e,"cmd", ["/k","wsl","-d",e])).toList();
        return distros.map(
          (e) {
            var envs2 = {
              "TERM": 'xterm-color',
              "COLORTERM": 'truecolor',
            };
            var args2 = ["-d", e];
            return Shell(e, "wsl", args: args2, envs: envs2);
          },
        ).toList();
      }
    }
    return [];
  }

  void search(String keyword) {
    emit(state.copyWith(keyword: keyword));
  }
}
