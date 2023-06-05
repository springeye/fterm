import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:path/path.dart' as path;
import 'package:fterm/bloc/home_tab_bloc.dart';
import 'package:fterm/di/di.dart';
import 'package:fterm/model/tab_item.dart';
import 'package:fterm/ui/connector/connector.dart';
import 'package:fterm/ui/popover.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:xterm/xterm.dart';
import 'package:flutter_gen/gen_l10n/SS.dart';

import 'connector/local_connector.dart';
import 'connector/zmodem.dart';
import 'dart:developer' as developer;

class TerminalTab extends TabItem {
  final Connector _connector;

  TerminalTab(String defaultTitle, Connector connector, {Widget? icon})
      : _connector = connector {
    super.title.value = Text(defaultTitle);
    super.content.value = TerminalPanel(this);
    super.icon.value = icon;
  }

  _init(void Function(String message) onClose) async {
    developer.log("TerminalTab._init");
    await _connector.connect();
    _connector.exitCode.then((code) {
      var message = "the process exited with exit code $code\n";
      print(message);
      // _connector.write(Uint8List.fromList(message.codeUnits));
      onClose(message);
      if (code == 0 || code == 1) {
        getIt<HomeTabBloc>().add(HomeTabEvent.remove(this));
      }
    });
  }
}

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

class TerminalPanel extends StatefulWidget {
  final TerminalTab _tab;

  const TerminalPanel(TerminalTab tab, {Key? key})
      : _tab = tab,
        super(key: key);

  @override
  State<TerminalPanel> createState() => _TtyPanelState();
}

class _TtyPanelState extends State<TerminalPanel>
    with AutomaticKeepAliveClientMixin, ProfilesPop {
  final terminal = Terminal(
    maxLines: 10000,
    platform: TerminalTargetPlatform.windows,
  );

  final terminalController = TerminalController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) _init();
      },
    );
  }

  Future<void> _init() async {
    developer.log("_TtyPanelState._init");
    await widget._tab._init((message) {
      terminal.write(message);
    });
    var connector = widget._tab._connector;

    terminal.onIconChange = (path) async {};

    terminal.onTitleChange = (title) {
      widget._tab.title.value = Text(title);
    };
    terminal.onResize = (w, h, pw, ph) {
      connector.resize(h, w, pw, pw);
    };
    _bindZModelHandle(connector.input, connector.output);
  }

  _bindZModelHandle(StreamSink<Uint8List> stdin, Stream<Uint8List> stdout) {
    final mux = ZModemMux(
      stdin: stdin,
      stdout: stdout,
    );
    mux.onTerminalInput = terminal.write;
    mux.onFileOffer = _handleFileOffer;
    mux.onFileRequest = _handleFileRequest;
    terminal.onOutput = mux.terminalWrite;
  }

  void _handleFileOffer(ZModemOffer offer) async {
    final outputDir = await FilePicker.platform.getDirectoryPath();
    if (outputDir == null) {
      offer.skip();
      return;
    }
    final file = File(path.join(outputDir, offer.info.pathname));

    void updateProgress(int received) {
      final length = offer.info.length;
      if (length != null) {
        terminal.write('\r');
        terminal.write('\x1b[K');
        terminal.write('${offer.info.pathname}: ');
        terminal.write((received / length * 100.0).toStringAsFixed(1));
        terminal.write('%');
      }
    }

    await offer
        .accept(0)
        .cast<List<int>>()
        .transform(WithProgress(onProgress: updateProgress))
        .pipe(file.openWrite());

    terminal.write('\r\n');
    terminal.write(SS.of(context).received_file(offer.info.pathname));
  }

  Future<Iterable<ZModemOffer>> _handleFileRequest() async {
    final result = await FilePicker.platform.pickFiles(withReadStream: true);

    if (result == null) {
      return [];
    }

    void updateProgress(PlatformFile file, int received) {
      terminal.write('\r');
      terminal.write('\x1b[K');
      terminal.write('${file.name}: ');
      terminal.write((received / file.size * 100).toStringAsFixed(1));
      terminal.write('%');
    }

    return result.files.map(
      (file) => ZModemCallbackOffer(
        ZModemFileInfo(
          pathname: path.basename(file.path!),
          length: file.size,
          mode: '100644',
          filesRemaining: 1,
          bytesRemaining: file.size,
        ),
        onAccept: (offset) => file.readStream!
            .skip(offset)
            .transform(
              WithProgress(onProgress: (bytes) => updateProgress(file, bytes)),
            )
            .cast<Uint8List>(),
        onSkip: () {
          terminal.write('\r\n');
          terminal.write('Rejected ${file.name}');
        },
      ),
    );
  }

  @override
  void dispose() {
    widget._tab._connector.dispose();
    super.dispose();
  }

  Widget _buildNativeMenu(Widget child) {
    return ContextMenuRegion(
      onDismissed: () => setState(() => ""),
      onItemSelected: (item) async {
        print(item.action);
        if (item.action == "copy") {
          final selection = terminalController.selection;
          if (selection != null) {
            final text = terminal.buffer.getText(selection);
            terminalController.clearSelection();
            await Clipboard.setData(ClipboardData(text: text));
            EasyLoading.showSuccess("复制成功");
          }
        } else if (item.action == "paste") {
          final data = await Clipboard.getData('text/plain');
          final text = data?.text;
          if (text != null) {
            terminal.paste(text);
          }
        } else if (item.action == "new") {
          var connector = LocalConnector();
          TabItem item = TerminalTab(
            connector.executable,
            connector,
            icon: connector.icon,
          );
          getIt<HomeTabBloc>().add(HomeTabEvent.add(item));
        }
      },
      menuItems: [
        MenuItem(title: SS.of(context).copy, action: "copy"),
        MenuItem(title: SS.of(context).paste, action: "paste"),
        MenuItem(
          title: SS.of(context).new_tab,
          action: "new",
        ),
      ],
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildNativeMenu(
      //Tomorrow
      BlocBuilder<AppConfigCubit, AppConfigState>(
        buildWhen: (p, c) => (p.colorSchemes != c.colorSchemes ||
            p.currentColorName != c.currentColorName),
        builder: (context, state) {
          return TerminalView(
            textStyle: const TerminalStyle(
              fontFamily: "Meslo LG L DZ for Powerline",
            ),
            terminal,
            padding: const EdgeInsets.all(5),
            controller: terminalController,
            theme: state.currentColor,
            autofocus: true,
            // onSecondaryTapDown: (details, offset) async {
            //   final selection = terminalController.selection;
            //   if (selection != null) {
            //     final text = terminal.buffer.getText(selection);
            //     terminalController.clearSelection();
            //     await Clipboard.setData(ClipboardData(text: text));
            //   } else {
            //     final data = await Clipboard.getData('text/plain');
            //     final text = data?.text;
            //     if (text != null) {
            //       terminal.paste(text);
            //     }
            //   }
            // },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

String get shell {
  if (Platform.isMacOS || Platform.isLinux) {
    return Platform.environment['SHELL'] ?? 'bash';
  }

  if (Platform.isWindows) {
    if (Process.runSync("where", ["pwsh.exe"]).exitCode == 0) {
      return 'pwsh.exe';
    }
    return 'powershell.exe';
    // return 'cmd.exe';
  }

  return 'sh';
}

class WithProgress<T> extends StreamTransformerBase<List<T>, List<T>> {
  WithProgress({this.onProgress});

  void Function(int progress)? onProgress;

  var _progress = 0;

  int get progress => _progress;

  @override
  Stream<List<T>> bind(Stream<List<T>> stream) {
    return stream.transform(StreamTransformer<List<T>, List<T>>.fromHandlers(
      handleData: (List<T> data, EventSink<List<T>> sink) {
        _progress += data.length;
        onProgress?.call(_progress);
        sink.add(data);
      },
    ));
  }
}
